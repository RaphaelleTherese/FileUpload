using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Horae
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateTable();
        }

        public void CreateTable()
        {
            string fileName = "BulkInsert_Test.txt";

            // Create Reference to Azure Storage Account
            String strorageconn = ConfigurationManager.AppSettings["StorageConnectionString"];
            CloudStorageAccount storageacc = CloudStorageAccount.Parse(strorageconn);

            //Create Reference to Azure Blob
            CloudBlobClient blobClient = storageacc.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("datasets");

            CloudBlockBlob blob = container.GetBlockBlobReference("BulkInsert_Test.txt");
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
                SqlCommand Com = new SqlCommand("BGIS_INSERT_CheckString", Conn);
                Com.Parameters.AddWithValue("Col", colsCat.Trim('^'));
                Com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader r = Com.ExecuteReader();
            }
        }
    }
}