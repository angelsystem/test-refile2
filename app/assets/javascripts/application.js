// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require refile
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on("upload:start", "form", function(e) {
  $(this).find("input[type=submit]").attr("disabled", true);
});

$(document).on("upload:success", "form", function(e) {
  if(!$(this).find("input.uploading").length) {
    $(this).find("input[type=submit]").removeAttr("disabled");
  }
  
  image_info = $("input[name='post[pictures_attributes][0][file]']").val();
  image_id = JSON.parse(image_info).id;

  url = "https://s3-us-west-2.amazonaws.com/weclubdemo3/cache/" + image_id;
  $("#image").html($("<img />").attr({src: url}));
});
