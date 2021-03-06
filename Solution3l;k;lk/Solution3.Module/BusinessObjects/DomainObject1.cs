using System;
using System.Linq;
using System.Text;
using DevExpress.Xpo;
using DevExpress.ExpressApp;
using System.ComponentModel;
using DevExpress.ExpressApp.DC;
using DevExpress.Data.Filtering;
using DevExpress.Persistent.Base;
using System.Collections.Generic;
using DevExpress.ExpressApp.Model;
using DevExpress.Persistent.BaseImpl;
using DevExpress.Persistent.Validation;

namespace Solution4.Module.BusinessObjects
{
    [DefaultClassOptions]
    [ImageName("BO_Contact")]
    [DefaultProperty("PropertyName")]
    [DefaultListViewOptions(MasterDetailMode.ListViewOnly, true, NewItemRowPosition.Top)]
    //[Persistent("DatabaseTableName")]
    // Specify more UI options using a declarative approach (http://documentation.devexpress.com/#Xaf/CustomDocument2701).
    public class DomainObject1 : BaseObject
    { // Inherit from a different class to provide a custom primary key, concurrency and deletion behavior, etc. (http://documentation.devexpress.com/#Xaf/CustomDocument3146).
        public DomainObject1(Session session)
            : base(session)
        {
        }
        public override void AfterConstruction()
        {
            base.AfterConstruction();
        }
        //private bool _Property2;
        private DomainObject2 _Obj2;
        private string _PropertyName1;
        private string _PropertyName;

        //[RuleUniqueValue, EditorAlias("Custom3"), Indexed]
        public string PropertyName
        {
            get
            {
                return _PropertyName;
            }
            set
            {
                SetPropertyValue("PropertyName", ref _PropertyName, value);
            }
        }
        //[EditorAlias("CustomWebLookup")]
        [ImmediatePostData]//DataSourceCriteria("Prop4 == true"),
        public DomainObject2 Obj2
        {
            get
            {
                return _Obj2;
            }
            set
            {
                SetPropertyValue("Obj2", ref _Obj2, value);
            }
        }

        [Size(SizeAttribute.DefaultStringMappingFieldSize)]
        [RuleUniqueValue]//, EditorAlias("TestProp1")]
        public string PropertyName1
        {
            get
            {
                return _PropertyName1;
            }
            set
            {
                SetPropertyValue("PropertyName1", ref _PropertyName1, value);
            }
        }
        protected override void OnChanged(string propertyName, object oldValue, object newValue)
        {
            base.OnChanged(propertyName, oldValue, newValue);
            switch (propertyName)
            {
                case "Obj2":
                    if (Obj2 != null)
                    {
                        PropertyName1 = Obj2.Prop1;
                    }
                    else
                    { PropertyName1 = ""; }
                    break;
                default:
                    break;
            }
        }
        //public bool Property2
        //{
        //    get
        //    {
        //        return _Property2;
        //    }
        //    set
        //    {
        //        SetPropertyValue("Property2", ref _Property2, value);
        //    }
        //}

    }
}
//private string _PropertyName2;
//private string _PropertyName;
//private string _PropertyName1;

//[RuleUniqueValue, EditorAlias("TestProp")]
//public string PropertyName1
//{
//    get
//    {
//        return _PropertyName1;
//    }
//    set
//    {
//        SetPropertyValue("PropertyName1", ref _PropertyName1, value);
//    }
//}
//            [RuleUniqueValue("Code", DefaultContexts.Save,
//CriteriaEvaluationBehavior = CriteriaEvaluationBehavior.BeforeTransaction)]
//[ModelDefault("PropertyEditorType", "Solution1.Module.Web.CustomStringEditor")]

//[EditorAlias("TestProp1")]
//    [ModelDefault("PredefinedValues",
//"Predefined Value 1;Predefined Value 2;Predefined Value 3;Predefined Value 4")]
//    public string PropertyName2
//    {
//        get
//        {
//            return _PropertyName2;
//        }
//        set
//        {
//            SetPropertyValue("PropertyName2", ref _PropertyName2, value);
//        }
//    }

//    private DomainObject1 _Contact;
//    [NonPersistent, ImmediatePostData]
//    public DomainObject1 Contact
//    {
//        get
//        {
//            if (_Contact == null && !String.IsNullOrEmpty(ContactName))
//            {
//                _Contact = Session.FindObject<DomainObject1>(new BinaryOperator("PropertyName", ContactName));
//            }
//            return _Contact;
//        }
//        set
//        {
//            SetPropertyValue("Contact", ref _Contact, value);
//            ContactName = _Contact == null ? String.Empty : _Contact._PropertyName;
//        }
//    }
//    private string _ContactName;
//    [Browsable(false)]
//    public string ContactName
//    {
//        get { return _ContactName; }
//        set { SetPropertyValue("ContactName", ref _ContactName, value); }
//    }
//private string _PersistentProperty;
//[XafDisplayName("My display name"), ToolTip("My hint message")]
//[ModelDefault("EditMask", "(000)-00"), Index(0), VisibleInListView(false)]
//[Persistent("DatabaseColumnName"), RuleRequiredField(DefaultContexts.Save)]
//public string PersistentProperty {
//    get { return _PersistentProperty; }
//    set { SetPropertyValue("PersistentProperty", ref _PersistentProperty, value); }
//}

//[Action(Caption = "My UI Action", ConfirmationMessage = "Are you sure?", ImageName = "Attention", AutoCommit = true)]
//public void ActionMethod() {
//    // Trigger a custom business logic for the current record in the UI (http://documentation.devexpress.com/#Xaf/CustomDocument2619).
//    this.PersistentProperty = "Paid";
//}