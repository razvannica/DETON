<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title> D E T O N </title>
    <link rel="shortcut icon" type="image/x-icon" href="images/icon.png" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/colorbox.css" type="text/css" media="all" />
</head>
<body>
<!-- wrapper -->
<div id="wrapper">
    <div class="light-bg">
        <!-- shell -->
        <div class="shell">
            <!-- header -->
            <?php require "header_logged.php" ?>
            <!-- end of header -->
            <!-- main -->
            <div class="main">
                <!-- content -->
                <section class="content">
                    <!-- post -->
                    <div class="post">
                        <!-- post-inner -->
                        <div class="post-inner">
                            <div class="post-cnt">
                                <form action="AddVisits.php" method="post">
                                    <h3 style="color: #1cfe10">Edit Prisoner Details</h3>
                                    <table style="width:100%">
                                        <tr><td>New entry date: </td><td>
                                                <input type="date" name="visit_date" style="width:250px; border:2px solid ;"/></td></tr>
                                        <tr><td colspan="2" style="height:10px"></td></tr>
                                        <tr><td>New release date: </td><td>
                                                <input type="date" name="visit_reason" style="width:250px; border:2px solid ;"/></td></tr>
                                        <tr><td colspan="2" style="height:10px"></td></tr>
                                        <tr><td>New probation status code: </td><td>
                                                <input type="number" name="exchange_data" style="width:250px; border:2px solid ;"/></td></tr>
                                        <tr><td colspan="2" style="height:10px"></td></tr>
                                        <br><br>
                                        <tr><td colspan="2" align="center"><input type="submit" value="Submit" style="height:30px; width: 60px;"/></td></tr>
                                    </table>
                                </form>
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
