<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title> D E T O N - login</title>
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
                                <h2>Authentify personnel </h2>
                                <div class="cl">&nbsp;</div>
                            </header>
                            <div class="post-cnt">
                                <?php
                                if (isset($_SESSION["user"])) {

                                    echo '<p> You are already connected as <span class=\"userLogged\"> ' . $_SESSION["user"] . '</span>.</p>';
                                    echo '<p> If you would like to end this session, please press the \'Logout\' button.</p>';

                                    return false;
                                }
                                echo '<p> Enter your account details in order to go further.</p>
											<p> If you do not have an account yet, consider creating a new one <a href="register.php" title="Create new account"> here</a>.</p>';
                                if (!$_POST) {
                                    ?>
                                    <form action="login.php" method="post">
                                        <table style="width:100%">
                                            <tr>
                                                <td>Username:</td>
                                                <td>
                                                    <input type="text" name="username" style="width:250px"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <input type="password" name="password" style="width:250px"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <br><br>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Login"
                                                                                      style="height:30px; width: 60px;"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <?php
                                    return false;
                                }
                                if (!isset($_SESSION["user"])) {
                                    $user = $_POST["username"];
                                } else {
                                    $user = $_SESSION["user"];
                                }
                                if (!isset($_SESSION["password"])) {
                                    $password = $_POST["password"];
                                } else {
                                    $password = $_SESSION["password"];
                                }
                                if ($user == "" AND $password == "") {
                                    ?>
                                    <br>
                                    <p1 style="color:red"> Both fields are mandatory!</p1>
                                    <form action="login.php" method="post">
                                        <table style="width:100%">
                                            <tr>
                                                <td>Username:</td>
                                                <td>
                                                    <input type="text" name="username"
                                                           style="width:250px; border:2px solid red;"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <input type="password" name="password"
                                                           style="width:250px; border:2px solid red;"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <br><br>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Login"
                                                                                      style="height:30px; width: 60px;"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <?php
                                } else if ($user == "") {
                                    ?>
                                    <br>
                                    <p1 style="color:red"> Username cannot be empty!</p1>
                                    <form action="login.php" method="post">
                                        <table style="width:100%">
                                            <tr>
                                                <td>Username:</td>
                                                <td>
                                                    <input type="text" name="username"
                                                           style="width:250px; border:2px solid red;"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <input type="password" name="password" style="width:250px"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <br><br>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Login"
                                                                                      style="height:30px; width: 60px;"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <?php
                                } else if ($password == "") {
                                    ?>
                                    <br>
                                    <p1 style="color:red"> Password cannot be empty!</p1>
                                    <form action="login.php" method="post">
                                        <table style="width:100%">
                                            <tr>
                                                <td>Username:</td>
                                                <td>
                                                    <input type="text" name="username" style="width:250px"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <input type="password" name="password"
                                                           style="width:250px; border:2px solid red;"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height:10px"></td>
                                            </tr>
                                            <br><br>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Login"
                                                                                      style="height:30px; width: 60px;"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <?php
                                } else {
//                                    $found = 0;
//                                    $dbusername = 'student';
//                                    $dbpassword = 'STUDENT';
//                                    $connection_string = 'localhost/xe';
//                                    $connection = oci_connect($dbusername, $dbpassword, $connection_string);
//                                    $query = oci_parse($connection, "SELECT 1 FROM deton_users WHERE username= :user_ AND user_password = :pass_ ");
//                                    oci_bind_by_name($query, ":user_", $user);
//                                    oci_bind_by_name($query, ":pass_", $password);
//                                    oci_execute($query);
//                                    $result = oci_fetch_array($query);
//                                    if ($result[0] == 1) {
//                                        if (!isset($_SESSION["user"])) {
//                                            $_SESSION["user"] = $user;
//                                        }
//                                        if (!isset($_SESSION["password"])) {
//                                            $_SESSION["password"] = $password;
//                                        }
//                                        echo "<br /><br /><p> Connection successful. </p><br>";
//                                    }


                                    $found = 0;
                                    $dbusername = 'STUDENT';
                                    $dbpassword = 'STUDENT';
                                    $connection_string = 'localhost/xe';
                                    $connection = oci_connect($dbusername, $dbpassword, $connection_string);
                                    $query = oci_parse($connection, "SELECT 1 FROM deton_users WHERE username= :user_ AND user_password = :pass_ ");
                                    oci_bind_by_name($query, ":user_", $user);
                                    oci_bind_by_name($query, ":pass_", $password);
                                    oci_execute($query);
                                    $result = oci_fetch_array($query);
                                    if ($result[0] == 1) {
                                        if (!isset($_SESSION["user"])) {
                                            $_SESSION["user"] = $user;
                                        }
                                        if (!isset($_SESSION["password"])) {
                                            $_SESSION["password"] = $password;
                                        }
                                        echo "<br /><br /><p> Connection successful. </p><br>";
                                    }


                                    if ($result == NULL) {
                                        ?>
                                        <br>
                                        <p1> This combination of username and password was not found in our database.
                                        </p1>
                                        <br>
                                        <p1> Please try again!</p1>
                                        <form action="login.php" method="post">
                                            <table style="width:100%">
                                                <tr>
                                                    <td>Username:</td>
                                                    <td>
                                                        <input type="text" name="username" style="width:250px"/></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height:10px"></td>
                                                </tr>
                                                <tr>
                                                    <td>Password:</td>
                                                    <td>
                                                        <input type="password" name="password" style="width:250px"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height:10px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height:10px"></td>
                                                </tr>
                                                <br><br>
                                                <tr>
                                                    <td colspan="2" align="center"><input type="submit" value="Login"
                                                                                          style="height:30px; width: 60px;"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </form>

                                        <?php
                                    }

                                }
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