<?php

require "../koneksi.php";
$sql = mysqli_query($conn, "SELECT * FROM pengaduan WHERE status = '0'");
$sql2 = mysqli_query($conn, "SELECT * FROM masyarakat");
$hitungPengaduan = mysqli_num_rows($sql);
$hitungMasyarakat = mysqli_num_rows($sql2);

if (isset($_GET['url']))
{
	$url=$_GET['url'];

	switch($url)
	{
		

		case 'verifikasi_pengaduan':
		include 'verifikasi_pengaduan.php';
		break;
		
		case 'detail_pengaduan':
		include 'detail_pengaduan.php';
		break;


	}
}
else
{
	?>
Selamat Datang di Web pengaduan masyarakat E-Complaint Gorontalo, web yang
dibuat untuk melaporkan pelanggaran atau penyimpangan kejadian-kejadian yang ada
pada masyarakat Gorontalo
<br><br>
Anda Login Sebagai :
<h2>
    <b>
        <?php echo $_SESSION['nama']; ?>

        <h4 class="mt-5">
            <b>Informasi Pengaduan</b>
        </h5>
        <hr>

        <div class="row mt-5">
            <div class="col-sm-3">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Pengaduan</h5>
                        <div class="row mr-auto mt-4">
                            <div class="col-3">
                                <h1 class="fas fa-file-export"></h1>
                            </div>
                            <div class="col-3 mb-3">
                                <h1 class="card-text"><?= $hitungPengaduan ?></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Jumlah Masyarakat Yang Mengadu</h5>
                        <div class="row mr-auto mt-4">
                            <div class="col-3">
                                <h1 class="fa fa-users" aria-hidden="true"></i>
                            </div>
                            <div class="col-3 mb-3">
                                <h1 class="card-text"><?= $hitungMasyarakat ?></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h4 class="mt-5">
            <b>Menu Petugas</b>
        </h5>
        <hr>

        <div class="row mt-5" style="height: 24vh;">
            <div class="col-sm-2">
                <a href="?url=verifikasi_pengaduan" class="btn btn-lg btn-info">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    Verifikasi Pengaduan</a>
            </div>
            <div class="col-sm-1">
                <a href="../logout.php" class="btn btn-lg btn-danger">
                    <i class="fa fa-power-off " aria-hidden="true"></i>
                    Keluar</a>
            </div>
        </div>

        <br>
        <br>

        <?php
 }
?>