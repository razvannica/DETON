<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title> D E T O N </title>
    <link rel="shortcut icon" type="image/x-icon" href="../images/icon.png"/>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
</head>
<body>
<!-- wrapper -->
<div id="wrapper">
    <div class="light-bg">
        <!-- shell -->
        <div class="shell">
            <!-- header -->
            <?php require "header.php" ?>
            <!-- end of header -->
            <!-- main -->
            <div class="main">
                <!-- content -->
                <section class="content">
                    <!-- post -->
                    <div class="post">
                        <!-- post-inner -->
                        <div class="post-inner">
                            <header>
                                <h2>Register personnel </h2>
                                <div class="cl">&nbsp;</div>
                            </header>
                            <div class="post-cnt">

                                <?php
                                if (!$_POST) {
                                    ?>

                                    <p> Create new account </p>
                                    <br>
                                    <form action="register.php" method="post">
                                        <table style="width:100%">
                                            <tr> <td> Username: </td><td><input type="text" name="username" style="width:250px"/></td></tr>
                                            <tr> <td colspan="2" style="height:10px"> </td></tr>
                                            <tr> <td> Email address: </td><td><input type="text" name="email" style="width:250px"/></td></tr>
                                            <tr> <td colspan="2" style="height:10px"> </td></tr>
                                            <tr> <td> Password: </td><td><input type="password" name="password1" style="width:250px"/></td></tr>
                                            <tr> <td colspan="2" style="height:10px"> </td></tr>
                                            <tr> <td> Retype password: </td><td><input type="password" name="password2" style="width:250px"/></td></tr>
                                            <tr> <td colspan="2" style="height:10px"> </td></tr>
                                            <tr> <td colspan="2" align="center"><input type="submit" value="Register" style="height:30px; width:60px"/></td></tr>
                                        </table>
                                    </form>
                                    <?php
                                } else {
                                    $username = $_POST["username"];
                                    $email = $_POST["email"];
                                    $password1 = $_POST["password1"];
                                    $password2 = $_POST["password2"];
                                    if ((!$username) || (!$email) || (!$password1) || (!$password2)) {
                                        ?>

                                        <p> Create new account </p>
                                        <br>
                                        <form action="register.php" method="post">
                                            <table style="width:100%">
                                                <tr> <td> Username: </td><td><input type="text" name="username" style="width:250px; border:2px solid red;"/></td></tr>
                                                <tr> <td colspan="2" style="height:10px"> </td></tr>
                                                <tr> <td> Email address: </td><td><input type="text" name="email" style="width:250px; border:2px solid red;"/></td></tr>
                                                <tr> <td colspan="2" style="height:10px"> </td></tr>
                                                <tr> <td> Password: </td><td><input type="password" name="password1" style="width:250px; border:2px solid red;"/></td></tr>
                                                <tr> <td colspan="2" style="height:10px"> </td></tr>
                                                <tr> <td> Retype password: </td><td><input type="password" name="password2" style="width:250px; border:2px solid red;"/></td></tr>
                                                <tr> <td colspan="2" style="height:10px"> </td></tr>
                                                <tr> <td colspan="2" align="center"><input type="submit" value="Register" style="height:30px; width:60px"/></td></tr>
                                            </table>
                                        </form>

                                        <p style="color:red"> All fields are mandatory! </p>
                                        <?php
                                    }}
                                ?>

                            </div>
                            <!-- end of post-cnt -->
                        </div>
                        <!-- post-inner -->
                    </div>
                    <!-- end of post -->

                </section>
                <!-- end of content -->

                <div class="cl">&nbsp;</div>
            </div>
            <!-- end of main -->

        </div>
        <!-- end of shell -->
    </div>
    <?php require('footer.php'); ?>
</div>
<!-- end of wrapper -->
</body>
</html>