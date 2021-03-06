﻿$(function () {
    setScreen(false);
  
    //url host chat hub
    $.connection.hub.url = "http://localhost:6928/signalr/hubs"

    // Declare a proxy to reference the hub.
    var chatHub = $.connection.chatHub;
    //
    registerClientMethods(chatHub);

    // Start Hub
    $.connection.hub.start().done(function () {
        registerEvents(chatHub)
    });
});

//ham kiem tra da login hay chua
//(1)neu chua login thi hien textbox nhap ten va an khung chat
//(2)neu da login thi an textboxt nhap ten va hien khung chat
function setScreen(isLogin) {
    if (!isLogin) {//(1)       
        //$("#divLogin").show();
        //$("#divChat").hide();
    }
    else {//(2)        
        //$("#divLogin").hide();
        //$("#divChat").show();
    }

}
//ket noi voi hub qua ten da nhap va gui message toi hub
function registerEvents(chatHub) {
    //khi nhap ten va enter thi goi fuction click nut btnStartChat
    $("#txtNickName").keypress(function (e) {
        if (e.which == 13) {
            $("#btnStartChat").click();
        }
    });

    //khi bam nut btnStartChat
    $("#btnStartChat").click(function () {

        var name = $("#txtNickName").val();//lay ten tu field nhap vao
        if (name.length > 0) {
            //ket noi voi hub qua ten
            chatHub.server.connect(name);
        }
        else {
            alert("Please enter name");
        }

    });

    //khi user nhap text message va enter thi goi ham bam nut btnSendMsg
    $("#txtMessage").keypress(function (e) {
        if (e.which == 13) {
            $('#btnSendMsg').click();
        }
    });

    //khi bam nut btnSendMsg thi gui text message user da nhap toi hub theo sendMessageToAll
    $('#btnSendMsg').click(function () {

        var msg = $("#txtMessage").val();
        if (msg.length > 0) {

            var userName = $('#hdCurrentUserName').val();
            chatHub.server.sendMessageToAll(userName, msg);
            $("#txtMessage").val('');
        }
    });
}
//ket noi voi hub
function registerClientMethods(chatHub) {

    // Calls when user successfully logged in
    chatHub.client.onConnected = function (id, userName, allUsers, messages) {

        setScreen(true);//an hien khung login va khung chat

        $('#hdCurrentConnectedId').val(id);//id ket noi (textbox an)
        $('#hdCurrentUserName').val(userName);//ten user(textbox an)
        $('#spanUser').html(userName);//ten user

        // Add All Users
        for (i = 0; i < allUsers.length; i++) {
            AddUser(chatHub, allUsers[i].ConnectionId, allUsers[i].UserName);
        }

        // Add Existing Messages
        for (i = 0; i < messages.length; i++) {

            AddMessage(messages[i].UserName, messages[i].Message);
        }


    }

    // On New User Connected
    chatHub.client.onNewUserConnected = function (id, name) {

        AddUser(chatHub, id, name);
    }


    // On User Disconnected
    chatHub.client.onUserDisconnected = function (id, userName) {

        $('#' + id).remove();

        var ctrId = 'private_' + id;
        $('#' + ctrId).remove();


        var disc = $('<div class="disconnect">"' + userName + '" logged off.</div>');

        $(disc).hide();
        $('#divusers').prepend(disc);
        $(disc).fadeIn(200).delay(2000).fadeOut(200);

    }

    chatHub.client.messageReceived = function (userName, message) {

        AddMessage(userName, message);
    }


    chatHub.client.sendPrivateMessage = function (windowId, fromUserName, message) {
        alert("aa");
        var ctrId = 'private_' + windowId;


        if ($('#' + ctrId).length == 0) {

            createPrivateChatWindow(chatHub, windowId, ctrId, fromUserName);

        }

        $('#' + ctrId).find('#divMessage').append('<div class="message"><span class="userName">' + fromUserName + '</span>: ' + message + '</div>');

        // set scrollbar
        var height = $('#' + ctrId).find('#divMessage')[0].scrollHeight;
        $('#' + ctrId).find('#divMessage').scrollTop(height);

    }

}

function AddUser(chatHub, connectedId, name) {

    var currentUserId = $('#hdCurrentConnectedId').val();

    var divUser = "";

    if (currentUserId == connectedId) {
        //div disable current user
        divUser = $('<div class="loginUser">' + name + "</div>");

    }
    else {

        divUser = $('<a id="' + connectedId + '" class="user" >' + name + '<a>');
        //click dup len the user de hien popup private chat
        $(divUser).dblclick(function () {

            var userId = $(divUser).attr('id');//$(this).attr('id');//$(this)=divUser

            if (currentUserId != userId)
                OpenPrivateChatWindow(chatHub, userId, name);

        });
    }

    $("#divusers").append(divUser);

}

function AddMessage(userName, message) {
    $('#divChatWindow').append('<div class="message"><span class="userName">' + userName + '</span>: ' + message + '</div>');

    var height = $('#divChatWindow')[0].scrollHeight;
    $('#divChatWindow').scrollTop(height);
}

function OpenPrivateChatWindow(chatHub, id, userName) {

    var ctrId = 'private_' + id;

    if ($('#' + ctrId).length > 0) return;

    createPrivateChatWindow(chatHub, id, ctrId, userName);

}

function createPrivateChatWindow(chatHub, currentUserId, ctrId, userName) {

    var div = '<div id="' + ctrId + '" class="ui-widget-content draggable" rel="0">' +
               '<div class="header">' +
                  '<div  style="float:right;">' +
                      '<img id="imgDelete"  style="cursor:pointer;" src="/Images/delete.png"/>' +
                   '</div>' +

                   '<span class="selText" rel="0">' + userName + '</span>' +
               '</div>' +
               '<div id="divMessage" class="messageArea">' +

               '</div>' +
               '<div class="buttonBar">' +
                  '<input id="txtPrivateMessage" class="msgText" type="text"   />' +
                  '<input id="btnSendMessage" class="submitButton button" type="button" value="Send"   />' +
               '</div>' +
            '</div>';

    var $div = $(div);

    // DELETE BUTTON IMAGE
    $div.find('#imgDelete').click(function () {
        $('#' + ctrId).remove();
    });

    // Send Button event
    $div.find("#btnSendMessage").click(function () {

        $textBox = $div.find("#txtPrivateMessage");
        var msg = $textBox.val();
        if (msg.length > 0) {

            chatHub.server.sendPrivateMessage(currentUserId, msg);
            $textBox.val('');
        }
    });

    // Text Box event
    $div.find("#txtPrivateMessage").keypress(function (e) {
        if (e.which == 13) {
            $div.find("#btnSendMessage").click();
        }
    });

    AddDivToContainer($div);

}

function AddDivToContainer($div) {
    $('#divContainer').prepend($div);

    $div.draggable({

        handle: ".header",
        stop: function () {

        }
    });

    ////$div.resizable({
    ////    stop: function () {

    ////    }
    ////});

}