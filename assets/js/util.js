/*$(document).ready(function(){
    
	function showMenu(){
		$('.menu .side-bar').addClass('show');
		$('.contenido').addClass('hide');
	}
	function hideMenu(){
		$('.contenido').removeClass('hide');
		$('.menu .side-bar').removeClass('show');
	}
	$('.btn-menu').click(function(){
		if($('.menu .side-bar').hasClass('show'))
			hideMenu();
		else
			showMenu();
	});
	
	$('.menu .side-bar ul li').on('click', function(e){
		hideMenu();
		$('.side-bar li').removeAttr('class');
		$(this).attr('class' ,'activo');			
	});
});*/



function makeTabBar(){
	$('.tab-page').hide();
	$($('.tab-page')[$('.tab-bar .tab.selected').index()]).show();

	$('.tab-bar .tab').on('click', function(e){
		$('.tab-page').hide();
		$($('.tab-page')[$(this).index()]).show();
		$('.tab-bar .tab').removeClass('selected');
		$(this).addClass('selected');	
	});
}