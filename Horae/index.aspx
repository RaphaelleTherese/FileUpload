<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Horae.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Data Set Manager</title>
    
   <meta charset="utf-8" />
    
    <!----- CSS ----->
    <link rel="shortcut icon" href="css/favicon.ico" />

    <!--FONTS-->
    <!-- MILO -->
    <link rel="stylesheet" href="https://brand.arizona.edu/sites/default/files/ua-banner/ua-web-branding/ua-fonts/milo.css" />
    
    <!-- BOOTSTRAP -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <%--<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css' />--%>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.typekit.net/zwa0lzk.css" />
    
    <style>
        .opt{
            border: solid gray 1px;
            height: 50vh;
            text-align: center;
            color: gray;
            border-radius: 10px;
            cursor: pointer;
            font-size: 50px;
            font-weight: 100;
        }
        .opt-r{
            margin-left: 25px;
        }
        .center{
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        .opt:hover{
            transition-duration: 0.15s;
            -webkit-box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.3);
            -moz-box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.3);
            box-shadow: 0px 0px 10px 2px rgba(0,0,0,0.3);
        }
        .inner-text{
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            position: absolute;
        }
    </style>
</head>
<body style="overflow-x: hidden !important">
    <form id="form1" runat="server">
        <div class="container center">
            <div class="row">
                <div class="col opt" id="upload" onclick="$('#UploadDataset').modal('show'); console.log('modal');">
                    <div class="inner-text">
                        Upload<br />
                        <i class="fas fa-upload"></i>
                    </div>
                </div>
                <div class="col opt opt-r" id="manage">
                    <div class="inner-text">
                        Manage<br />
                        <i class="fas fa-table"></i>
                    </div>
                </div>
            </div>
        </div>


        <!----- MODALS ----->
        <div class="modal fade" tabindex="-1" role="dialog" id="UploadDataset">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Upload Dataset</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input runat="server" id="add_dataset" name="add_dataset" required="required" type="file" accept=".txt, .xslx" />
                        <p style="color: red">* Max file size is 20mb. The file must be a txt file. </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onserverclick="UploadFile" runat="server">Save</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!------ SCRIPTS ------>
    <!-- SCRIPTS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

     <!-- jQuery 3.2.1 -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

    <!-- Bootstrap 4.4.1 -->
    <script src="js/bootstrap.min.js"></script>

    <script>
        console.log('ready');
    </script>
</body>
</html>
