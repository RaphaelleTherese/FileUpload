using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;

namespace Horae
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CreateTable("BulkInsert_Test");
        }

        public void UploadFile(Object sender, EventArgs e)
        {
            // Create Reference to Azure Storage Account
            String strorageconn = ConfigurationManager.AppSettings["StorageConnectionString"];
            CloudStorageAccount storageacc = CloudStorageAccount.Parse(strorageconn);

            //Create Reference to Azure Blob
            CloudBlobClient blobClient = storageacc.CreateCloudBlobClient();
            //The next 2 lines create if not exists a container named "images"
            CloudBlobContainer container = blobClient.GetContainerReference("datasets");

            container.CreateIfNotExists();

            HttpPostedFile dataset = null;
            dataset = Request.Files["add_dataset"];

            string dataset_name = dataset.FileName.Replace('-', '_');

            if (dataset.ContentLength > 0)
            {
                CloudBlockBlob blockBlob1 = container.GetBlockBlobReference(dataset_name);
                blockBlob1.Properties.ContentType = "text/plain";
                using (var filestream1 = dataset.InputStream)
                {
                    blockBlob1.UploadFromStream(filestream1);
                }
            }

            LoadFile(dataset_name.Split('.')[0]);
        }
        public void LoadFile(string FileName)
        {
            // Create Reference to Azure Storage Account
            String strorageconn = ConfigurationManager.AppSettings["StorageConnectionString"];
            CloudStorageAccount storageacc = CloudStorageAccount.Parse(strorageconn);

            //Create Reference to Azure Blob
            CloudBlobClient blobClient = storageacc.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("datasets");

            CloudBlockBlob blob = container.GetBlockBlobReference(FileName + ".txt");
            string contents = blob.DownloadText();

            String[] cols = contents.Split('\n')[0].Split('\t');
            string colsCat = "";

            foreach (String col in cols)
            {
                colsCat += col.Replace(' ', '_') + "^";
            }

            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.AppSettings["DBConn"]))
            {
                Conn.Open();
                SqlCommand Com = new SqlCommand("BGIS_BULK_INSERT_DynamicBulkInsert", Conn);
                Com.Parameters.AddWithValue("Col", colsCat.Trim('^'));
                Com.Parameters.AddWithValue("FileName", FileName);
                Com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader r = Com.ExecuteReader();
            }
        }
    }
}