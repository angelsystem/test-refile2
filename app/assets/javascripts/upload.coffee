jQuery ->
  $(document).on "upload:start", "form", (e) ->
    $(this).find("input[type=submit]").attr "disabled", true
    # $("#image").text("Uploading...")
    $('#loader-wrapper').show()
    $("#progress-bar").slideDown('slow')

  $(document).on "upload:progress", "form", (e) ->
    detail          = e.originalEvent.detail
    percentComplete = Math.round(detail.progress.loaded / detail.progress.total * 100)
    $('.progress-bar').width("#{percentComplete}%");
    $("#progress-bar-text").text("#{percentComplete}% Complete")

  $(document).on "upload:success", "form", (e) ->
    console.log e
    unless $(this).find("input.uploading").length
      $(this).find("input[type=submit]").removeAttr "disabled"
      $('#loader-wrapper').hide()
    image_info = $("input[name='article[image]']").val()
    unless image_info == ""
      image_value = JSON.parse(image_info)
      url = "https://s3-us-west-2.amazonaws.com/weclubpresigned/cache/" + image_value.id
      $("#image").html($("<img />").attr('src', url))
