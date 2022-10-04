<?php
require "koneksi.php";

$queryPengaduan = mysqli_query($conn, "SELECT * FROM pengaduan WHERE nik='$_SESSION[nik]'");
$queryPengaduan1 = mysqli_query($conn, "SELECT * FROM pengaduan WHERE status = 'selesai' AND nik='$_SESSION[nik]'");
$queryPengaduan2 = mysqli_query($conn, "SELECT * FROM pengaduan WHERE status = 'proses' AND nik='$_SESSION[nik]'");
$queryPengaduan3 = mysqli_query($conn, "SELECT * FROM pengaduan WHERE status = '0' AND nik='$_SESSION[nik]'");
$hitungPengaduan = mysqli_num_rows($queryPengaduan);
$hitungTanggapan = mysqli_num_rows($queryPengaduan1);
$hitungTanggapanProses = mysqli_num_rows($queryPengaduan2);
$hitungTanggapanBelum = mysqli_num_rows($queryPengaduan3);


if (isset($_GET['url']))
{
	$url=$_GET['url'];

	switch($url)
	{
		case 'tulis_pengaduan';
		include 'tulis_pengaduan.php';
		break;

		case 'lihat_pengaduan';
		include 'lihat_pengaduan.php';
		break;

		case 'detail_pengaduan';
		include 'detail_pengaduan.php';
		break;

		case 'lihat_tanggapan';
		include 'lihat_tanggapan.php';
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
<h2 class="mb-5">
    <b>
        <?php echo $_SESSION['nama']?></h2>
</b>

<h4 class="mt-5">
    <b>Informasi Pengaduan</b>
</h5>
<hr>

<div class="row mt-5">
    <div class="col-sm-3">
        <div class="card text-white bg-danger mb-3" style="max-width: 22rem;">
            <div class="card-body">
                <h5 class="card-title">Jumlah Total Pengaduan</h5>
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
        <div class="card text-white bg-danger mb-3" style="max-width: 22rem;">
            <div class="card-body">
                <h5 class="card-title">Belum Ditanggapi</h5>
                <div class="row mr-auto mt-4">
                    <div class="col-3">
                        <h1 class="fa fa-eye-slash" aria-hidden="true"></h1>
                    </div>
                    <div class="col-3 mb-3">
                        <h1 class="card-text"><?= $hitungTanggapanBelum ?></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card text-white bg-danger mb-3" style="max-width: 22rem;">
            <div class="card-body">
                <h5 class="card-title">Sedang Diproses</h5>
                <div class="row mr-auto mt-4">
                    <div class="col-3">
                        <h1 class="fa fa-eye" aria-hidden="true"></h1>
                    </div>
                    <div class="col-3 mb-3">
                        <h1 class="card-text"><?= $hitungTanggapanProses ?></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card text-white bg-danger mb-3" style="max-width: 22rem;">
            <div class="card-body">
                <h5 class="card-title">Pengaduan Ditanggapi</h5>
                <div class="row mr-auto mt-4">
                    <div class="col-3">
                        <h1 class="fa fa-check-square" aria-hidden="true"></h1>
                    </div>
                    <div class="col-3 mb-3">
                        <h1 class="card-text"><?= $hitungTanggapan ?></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<h4 class="mt-5">
    <b>Menu Masyarakat</b>
</h5>
<hr>

<div class="row mt-5" style="height: 24vh;">
    <div class="col-md-2">
        <a href="?url=tulis_pengaduan" class="btn btn-lg btn-primary text-light">
            <i class="fa fa-plus" aria-hidden="true"></i>
            Buat Pengaduan</a>
    </div>
    <div class="col-2">
        <a href="?url=lihat_pengaduan" class="btn btn-lg btn-info">
            <i class="fa fa-eye" aria-hidden="true"></i>
            Lihat Pengaduan</a>
    </div>
    <div class="col-md-1">
        <a href="logout.php" class="btn btn-lg btn-danger">
            <i class="fa fa-power-off " aria-hidden="true"></i>
            Keluar</a>
    </div>
</div>

<?php
}
?>