<script src="./controller/index.php?js=app"></script>

<script>
app.config(function($routeProvider) {
	$routeProvider.
	when('/',{templateUrl:'view/?tpl=index',controller:'index'}).
	<?php
		$scriptdir  = "controller/user";
		echo "//$scriptdir".PHP_EOL;
		foreach (glob("$scriptdir/*.js") as $file) {
			
			$fn = basename($file, '.js');
			if($fn != 'app'){
				echo "when('/$fn',{templateUrl:'view/?tpl=$fn',controller:'$fn'}).".PHP_EOL;
			}
		}
	?>
	otherwise({
        templateUrl : "view/?tpl=blanco", 
		controller: "otros"
    });
});
</script>
<?php
foreach (glob("$scriptdir/*.js") as $file) {
	if(basename($file) != 'app.js'){
		echo '<script src="./controller/index.php?js='.basename($file, '.js').'"></script>'.PHP_EOL;
	}
}
?>
