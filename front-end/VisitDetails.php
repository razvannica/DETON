<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>D E T O N</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/icon.png"/>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
</head>
<style>
    th{
        font-size: 16px;
    }
</style>
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


                    <div class = "visitDetails" align="center" >
                        <p style="font-size:24px;" align="left">Visit Details: </p>
                        <br>
                        <br>
                        <table width="850" ; border="0";  align="center" ; cellpadding="0";>

                            <tr>
                                <th align="left">Visit ID</th>
                                <th align="left">Prisoner ID</th>
                                <th align="left">Visit Date</th>
                                <th align="left">Visit Reason</th>
                                <th align="left">Observations</th>
                                <th align="left">Exchanged Data</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>41</td>
                                <td>22/03/1998</td>
                                <td>Visita matrimoniala</td>
                                <td>observatii</td>
                                <td>sadada</td>

                            </tr>
                        </table>
                        <br>
                        <br>
                        <p style="font-size:24px;" align="left">Visitors Details: </p>
                        <table width="850" ; border="0";  align="center" ; cellpadding="0";>

                            <tr>
                                <th align="left">CNP</th>
                                <th align="left">First Name</th>
                                <th align="left">Last Name</th>
                                <th align="left">Middle Name</th>
                            </tr>
                            <br>
                            <br>
                            <tr>
                                <td>13145131</td>
                                <td>nume</td>
                                <td>prenume</td>
                                <td>mijloc_nume</td>

                            </tr>
                        </table>


                    </div>


                    <!-- end of post -->
                </section>
                <!-- end of content -->
                <!-- sidebar -->
                <!-- end of sidebar -->

                <!-- end of sidebar -->
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
