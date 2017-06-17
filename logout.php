<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Forum Filme - Portalul tau pentru filme</title>
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
                                <h2>Disconnect</h2>
                                <div class="cl">&nbsp;</div>
                            </header>
                            <div class="post-cnt">

                                <p>You have been succesfully disconnected!<br>
                                    Good bye!</p>

                                <br><br>

                                <?php
                                unset($_SESSION['user']);
                                unset($_SESSION['parola']);
                                session_destroy();
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
            <?php require('footer.php'); ?>
        </div>
        <!-- end of shell -->
    </div>
</div>
<!-- end of wrapper -->
</body>
</html>