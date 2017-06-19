<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title> D E T O N </title>
    <link rel="shortcut icon" type="image/x-icon" href="images/icon.png" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/colorbox.css" type="text/css" media="all" />
    <style>
        p {
            display: inline;
        }
    </style>
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
                                <form action="visits.php" method="post">
                                    <table style="width:100%">
                                        <p>Seach by name:<br></p>
                                        <input type="text" name="search" placeholder="Search..">
                                        <tr>
                                            <th align="left" ><font size="4" color="white"> Last name</font></th>
                                            <th align="left" ><font size="4" color="white">First name</font></th>
                                        </tr>
                                        <tr>
                                            <td>Nume_detinut</td>
                                            <td>Prenume_detinut</td>
                                            <td><button type="button"><a  href="VisitDetails.php">Details</a></button></td>
                                            <td><button type="button"><a href="EditVisit.php">Edit Visit</a></button></td>
                                            <td><button type="button"><a href="DeleteVisit.php">Delete Visit</a></button></td>
                                        </tr>

                                        <br><br>
                                        <td><button type="button"><a  href="AddVisits.php">Add Visit</a></button></td>
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
