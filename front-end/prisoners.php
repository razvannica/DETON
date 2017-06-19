<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>D E T O N</title>
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


                    <div class = "prisoner" align="center" >
                        <p align="left"> <button type="button"><a href="AddPrisoner.php" >Add Prisoner</a> </button></p>
                        <table width="650" ; border="0";  align="center" ; cellpadding="0";>

                            <tr>
                                <th align="left">Prison ID</th>
                                <th align="left">First Name</th>
                                <th align="left">Middle Name</th>
                                <th align="left">Last Name</th>
                            </tr>
                            <tr>
                                <td>41</td>
                                <td>gigi</td>
                                <td>emil</td>
                                <td>ovidiu</td>
                                <td><button type="button"><a href="PrisonerDetails.php"> Prisoner Details</a></button></td>
                                <td><button type="button"><a href="EditPrisoner.php"> Edit Prisoner</a></button></td>
                                <td><button type="button">Delete Prisoner</button></td>

                            </tr>
                        </table>


                    </div>


                    <!-- end of post -->
                </section>
                <!-- end of content -->
                <!-- sidebar -->
                <!-- sidebar -->
                <aside class="sidebar">
                    <div class="widget">
                        <br>
                        <br>
                        <br>
                        <h3 class="widgettitle">Filters</h3>
                        <form action="">
                            Gender:
                            <br>
                            <input type="radio" name="gender" value="Male">He is male<br>
                            <input type="radio" name="gender" value="Female">She is female<br>
                            Prison:
                            <br>
                            <input type="radio" name="prison" value="Id">Prison ID 1.<br>
                            <input type="radio" name="prison" value="Id">Prison ID 2.<br>
                            <input type="radio" name="prison" value="Id">Prison ID 3.<br>
                            <input type="radio" name="prison" value="Id">Prison ID 4.<br>
                            <input type="radio" name="prison" value="Id">Prison ID 5.<br>
                            Visit Status:
                            <br>
                            <input type="radio" name="visit" value="Yes/No">Prisoners that have had visits.<br>
                            <input type="radio" name="visit" value="Yes/No">Prisoners that will have visits.<br>
                        </form>
                    </div>
                </aside>
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
