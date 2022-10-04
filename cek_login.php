<?php
require 'koneksi.php';
$user=$_POST['username'];
$pass=$_POST['password'];
$sql=mysqli_query($conn,"select * from masyarakat where username='$user' and password='$pass' ");
$cek=mysqli_num_rows($sql);

	if ($cek>0)
	{
		$data=mysqli_fetch_array($sql);
		session_start();
		$_SESSION['nama']=$data['nama'];
		$_SESSION['nik']=$data['nik'];
		?>
		<script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
		<script>
				const Toast = Swal.mixin({
				  toast: true,
				  position: 'top-end',
				  showConfirmButton: false,
				  timer: 3000
				});
				 
				Toast.fire({
				  type: 'success',
				  title: 'Signed in successfully'
				})
		</script>
		<?php
		header('location:masyarakat.php');
	}
	else
	{
		?>
		<script type="text/javascript">
		alert ('Username Atau Password tidak ditemukan');
		window.location="index.php";
		</script>
<?php
	}
	?>