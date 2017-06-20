<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>D E T O N</title>
    <link rel="shortcut icon" type="image/x-icon" href="../images/icon.png"/>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
</head>
<style>
    td {
        border: 1px solid white;

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
                    <div class="post">
                        <!-- post-inner -->
                        <div class="post-inner">
                            <?php
                            $dbusername = 'STUDENT';
                            $dbpassword = 'STUDENT';
                            $connection_string = 'localhost/xe';
                            $connection = oci_connect($dbusername, $dbpassword, $connection_string);
                            $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners");
                            oci_execute($query);
                            $var2 = oci_fetch_array($query);
                            $query = oci_parse($connection, "Select count(visit_id) as Rez from visits");
                            oci_execute($query);
                            $var1 = oci_fetch_array($query);
                            ?>
                            <table style="width: 500px;height: 250px;">
                                <tr>
                                    <th align="left">Ages</th>

                                    <th>Number of inmates</th>
                                    <th>Percantage of inmates</th>
                                    <th>Percantage of visits</th>

                                </tr>
                                <tr>
                                    <td align="left">Under 18</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))<18");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo $var[0];
                                        ?>

                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))<18");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))<18");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 18-21</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 18 and 21");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 18 and 21");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 18 and 21");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 22-25</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 22 and 25");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 22 and 25");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 22 and 25");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 26-30</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 26 and 30");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 26 and 30");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 26 and 30");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 31-35</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 31 and 35");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 31 and 35");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 31 and 36");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 36-40</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 36 and 40");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 36 and 40");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 36 and 40");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 41-45</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 41 and 45");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 41 and 45");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 41 and 45");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 46-50</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 46 and 50");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 46 and 50");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 46 and 50");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 50-55</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 51 and 56");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 51 and 56");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 51 and 56");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 56-60</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 56 and 60");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 56 and 60");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 56 and 60");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Ages 61-65</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 61 and 65");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 61 and 65");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy')) between 61 and 65");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">Over 65</td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))>65");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo $row[0];
                                        ?>
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "Select count(prisoner_id) as Rez from prisoners where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))>65");
                                        oci_execute($query);
                                        $row = oci_fetch_array($query);
                                        echo number_format($row[0] / $var2[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                    <td align="right">
                                        <?php
                                        $query = oci_parse($connection, "select count(visit_id) from visits v join prisoners p1 on v.convict_id=p1.prisoner_id where to_number(to_char(sysdate,'yyyy'))-to_number(to_char(birth_date,'yyyy'))>65");
                                        oci_execute($query);
                                        $var = oci_fetch_array($query);
                                        echo number_format($var[0] / $var1[0] * 100, 2);
                                        ?>
                                        %
                                    </td>
                                </tr>

                            </table>
                            <!-- end of post-cnt -->
                        </div>
                        <!-- post-inner -->
                    </div>
                    <!-- end of post -->


                    <!-- end of post -->
                </section>
                <!-- end of content -->
                <!-- sidebar -->


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
<?php
oci_close($connection);
?>
</body>
</html>
