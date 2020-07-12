<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Horae.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Data Set Manager</title>
    
   <meta charset="utf-8" />

    <!--FONTS-->
    <!--MILO-->
    <link rel="stylesheet" href="https://brand.arizona.edu/sites/default/files/ua-banner/ua-web-branding/ua-fonts/milo.css" />

    <!--CSS-->
    <!-- Tether 1.4.0 -->
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css' />

    <!-- Bootstrap 4.0.0 -->
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css' />

    <!-- Animate 3.5.2 -->
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css' />

    <!-- Font Awesome 4.7.0 -->
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' />

    <%--OTHER JS--%>
    <script src="https://cdn.rawgit.com/leemark/embed360/a1e48f2bc7cf77f8f4bcae2ceeafe91a2e31fbf1/embed360.js"></script>
    <script src="https://apis.google.com/js/platform.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
        .opt{
            border: solid gray 1px;
            height: 50vh;
            text-align: center;
            color: gray;
            border-radius: 10px;
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
    </style>
</head>
<body style="overflow-x: hidden !important">
    <form id="form1" runat="server">
        <div class="container center">
            <div class="row">
                <div class="col opt" id="upload">
                   Upload
                </div>
                <div class="col opt opt-r" id="manage">
                    Manage 
                </div>
            </div>
        </div>
    </form>
</body>
</html>
