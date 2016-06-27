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
    reference = e.target.getAttribute("data-reference")
    image_info = $("input[data-reference='#{reference}'][type=hidden]").val()
    unless image_info == ""
      image_value = JSON.parse(image_info)
      if image_value instanceof Array
        for k of image_value
          object_id = image_value[k].id
          url = "https://s3-us-west-2.amazonaws.com/weclub.dev/cache/" + object_id
          id_div_image = e.target.getAttribute("id")
          image_content = document.createElement('img')
          image_content.setAttribute('src', "#{url}")
          document.getElementById("#{id_div_image}_image").append(image_content)
      else
        console.log "NO es arreglo"
        url = "https://s3-us-west-2.amazonaws.com/weclub.dev/cache/" + image_value.id
        id_div_image = e.target.getAttribute("id")
        $("##{id_div_image}_image").html($("<img />").attr('src', url))
