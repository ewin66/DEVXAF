﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace TestFunctionStatic
{
    class Program
    {
        public static string RejectMarks(string text, string separator = null)
        {
            string[] pattern = new string[7];
            pattern[0] = "a|(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)";
            pattern[1] = "O|(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)";//o|(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)";
            pattern[2] = "e|(é|è|ẻ|ẹ|ẽ|ê|ế|ề|ể|ệ|ễ)";
            pattern[3] = "u|(ú|ù|ủ|ụ|ũ|ư|ứ|ừ|ử|ự|ữ)";
            pattern[4] = "i|(í|ì|ỉ|ị|ĩ)";
            pattern[5] = "y|(ý|ỳ|ỷ|ỵ|ỹ)";
            pattern[6] = "d|đ";
            for (int i = 0; i < pattern.Length; i++)
            {
                char replaceChar = pattern[i][0];
                MatchCollection matchs = Regex.Matches(text, pattern[i]);
                foreach (Match m in matchs)
                {
                    text = text.Replace(m.Value[0], replaceChar);
                }
            }
            //string str1 = "/!|@|%|\\^|\\*|\\(|\\)|\\+|\\=|\\<|\\>|\\?|\\/|,|\\.|\\:|\\;|\'| |\"|\\&|\\#|\\[|\\]|~|$|_/g";
            //Match matchs1 = Regex.Match(text, str1);
            //text = text.Replace(matchs1.Value, "-");
            text = Regex.Replace(text, "^-+|(?<=-)-+|-+$", "");
            if (separator != null)
            {
                text = Regex.Replace(text, " ", separator);
            }
            return text;
        }
        static void Main(string[] args)
        {
            Debug.WriteLine(RejectMarks("Ô Bài Trang 1", "-"));
            //string s = "asdfsdfdf.sdfsd.wer";
            //string aa = s.Substring(0, s.LastIndexOf('.')) + "_thumb" + s.Substring(idx + 1);

            string s = "Hinh1.png";
            //int idx = s.LastIndexOf('.');
            //Console.WriteLine(s.Substring(0, s.LastIndexOf('.'))); // "My. name. is Bond"
            //Console.WriteLine(s.Substring(s.LastIndexOf('.') + 1)); // "_James Bond!"
            string bbb = s.Substring(0, s.LastIndexOf('.')) + "_thumb" + s.Substring(s.LastIndexOf('.'));
            Debug.WriteLine(bbb);
            System.Uri uri = new Uri("http://localhost:1173/FileData/Chrysanthemum.jpg");
            string uriWithoutScheme =  uri.PathAndQuery;
            var urii = new Uri("http://www.example.com:80/dir/?query=test");
            var clean = urii.GetComponents(UriComponents.Scheme |
                                           UriComponents.Host |
                                           UriComponents.PathAndQuery,
                                           UriFormat.UriEscaped);
            Debug.WriteLine(clean);
            Debug.WriteLine(uriWithoutScheme);
        }
    }

}
