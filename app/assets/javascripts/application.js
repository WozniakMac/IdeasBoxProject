//= require material
//= require jquery
//= require jquery_ujs
//= require imagesloaded.pkgd.min.js
//= require jquery-imagefill.js
//= require material-click.js


$( document ).ready(function() {
  //Animacja wczytania
    $('.ids-image-card').addClass('show');
    //Dopasaowanie obrazków do diva
    $('.ideashare-idea').imagefill({target:'.ids-image-card'})
    //Ukrywanie notice
    $('.ids-notice').click(function(){
        $('.ids-notice').hide(1000);
    });
    $('#error_explanation').click(function(){
        $('#error_explanation').hide(1000);
    });
  
});