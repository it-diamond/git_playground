<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="CnfGranite.Login" %>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="Shortcut Icon" href="Lassets/images/favicon.png" />
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="Lassets/vendor/bootstrap/css/bootstrap.min.css"/>
    <link href="Lassets/vendor/fonts/circular-std/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="Lassets/libs/css/style.css"/>
    <link rel="stylesheet" href="Lassets/vendor/fonts/fontawesome/css/fontawesome-all.css"/>
    <script src="Lassets/libs/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit").click(function () {
                window.location = "Dashboard.aspx";
            })

        })
    </script>
</head>

<body>

    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="https://www.diamondshipping.in"><img class="logo-img" src="Lassets/images/logo.png" alt="logo"></a><span class="splash-description">Trust Us & Be Assured!.</span></div>
            <div class="text-center"><span class="splash-description">C & F Granite Division</span></div>
            <div class="card-body">
                <form runat="server" id="form1">
                    <div class="form-group">
                        <asp:TextBox cssclass="form-control form-control-lg" id="username" runat="server"  placeholder="Username" autocomplete="off"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox cssclass="form-control form-control-lg" id="password" runat="server"  placeholder="Password" autocomplete="off" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
                        </label>
                    </div>
                   <asp:Button id="submit" class="btn btn-primary btn-lg btn-block" runat="server" Text ="Sign in" /><br /></form>
                <asp:Label ID ="Invalidlogin" runat ="server" />
            </div>
            
        </div>
    </div>
   <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="Lassets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="Lassets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
   
    
</body>
 
</html>
