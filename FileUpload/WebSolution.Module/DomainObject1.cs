using System;
using DevExpress.Xpo;
using DevExpress.ExpressApp;
using DevExpress.Persistent.Base;
using DevExpress.Persistent.BaseImpl;
using DevExpress.Persistent.Validation;
using System.Drawing;
using System.Web;
using System.IO;
using System.ComponentModel;

namespace WebSolution.Module
{
    [DefaultClassOptions]
    //[FileAttachment("File")]
    public class DomainObject1 : BaseObject
    {
        public DomainObject1(Session session)
            : base(session)
        {
        }

        private FileData _file;
        [NonPersistent, VisibleInListView(false)]
        public FileData FileData
        {
            get
            {
                return _file;
            }
            set
            {
                SetPropertyValue("File", ref _file, value);
            }
        }

        //can refesh listview
        [EditorAlias("ASPxReadOnlyImagePropertyEditor")]
        [VisibleInLookupListView(false)]//VisibleInListView(false),
        public string PresentationImage
        {
            get
            {
                if (ImageUrl != null)
                {

                    return ImageUrl.Substring(0, ImageUrl.LastIndexOf('.')) + "_thumb" + ImageUrl.Substring(ImageUrl.LastIndexOf('.'));
                }
                return "";
            }
        }
        private string _ImageUrl;

        [Size(1028), Browsable(false)]
        public string ImageUrl
        {
            get
            {
                return _ImageUrl;
            }
            set
            {
                SetPropertyValue("ImageUrl", ref _ImageUrl, value);
            }
        }
        protected override void OnSaving()
        {
            base.OnSaving();
            if (FileData != null)
            {
                if (!FileData.IsEmpty)
                {
                    string filePath = HttpContext.Current.Request.MapPath("~/FileData/" + FileData.FileName);
                    Stream stream = new FileStream(filePath, FileMode.CreateNew, FileAccess.Write);
                    FileData.SaveToStream(stream);
                    var currentPicture = Image.FromStream(new System.IO.MemoryStream(FileData.Content));
                    var thumbImage = ScaleImage(currentPicture, 100);
                    int fileExtPos = FileData.FileName.LastIndexOf(".");
                    string thumbPath = "";
                    if (fileExtPos >= 0)
                        thumbPath = FileData.FileName.Substring(0, fileExtPos) + "_thumb" + Path.GetExtension(FileData.FileName);
                    thumbImage.Save(HttpContext.Current.Request.MapPath("~/FileData/" + thumbPath));
                    ImageUrl = "FileData/" + FileData.FileName;
                    stream.Close();
                    FileData.Clear();
                }
            }
        }

        public static Image ScaleImage(Image image, int maxHeight)
        {
            var ratio = (double)maxHeight / image.Height;

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);
            using (var g = Graphics.FromImage(newImage))
            {
                g.DrawImage(image, 0, 0, newWidth, newHeight);
            }
            return newImage;
        }

        public static string ToThumb(string s)
        {
            return s.Substring(0, s.LastIndexOf('.')) + "_thumb" + s.Substring(s.LastIndexOf('.'));
        }

        protected override void OnDeleting()
        {
            base.OnDeleting();
            File.Delete(HttpContext.Current.Request.MapPath(ImageUrl));
            File.Delete(HttpContext.Current.Request.MapPath(ToThumb(ImageUrl)));
        }
    }
}
//[ASPxReadOnlyImageSizeAttribute(100, 100, "Width", "Height")]

//Image.FromFile(filePath);

////Bitmap bitmap = new Bitmap(stream);
//System.Drawing.Image currentPicture = System.Drawing.Image.FromFile(FileData.FileName);

//Image thumbImage = currentPicture.GetThumbnailImage(120, 120, () => false, IntPtr.Zero);

//int index = FileData.FileName.LastIndexOf('.');

//string path = "FileData/" + Path.ChangeExtension(FileData.FileName, "thumb");
//thumbImage.Save("FileData/" + thumbPath);//+ Path.ChangeExtension(FileData.FileName, "thumb"));


