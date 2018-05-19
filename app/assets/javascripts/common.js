function clear_search(){
  $(".search").val('')
}

$('.fa-copy').on("click", function(){
  $('#spinner').show();
})

$(document).ready(function(){
  $('.froalaEditor').froalaEditor({
    imageUploadMethod: 'POST',
    imageUploadURL: '/upload_photos/upload_editor',
    height: 400
  });
  var myLazyLoad = new LazyLoad({
    elements_selector: "img"
  });
  $('#product_images').slick({dots: true});
  $(".best_in_place").best_in_place();
})

function readURL(input, render_element) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $(render_element).html("");
      $(render_element).append(`<div class="container"><img class="image" src="${e.target.result}"><div class="middle"><div class="text" onclick='remove_file(this, "#avatar_del")'>Xoá</div></div></div>`)
      $('#avatar_del').val('')
    }
    reader.readAsDataURL(input.files[0]);
  }
}

function remove_file(el, input_el){
  $(el).closest(".container").remove();
  $(input_el).val(true);
}

function toggleInfo(el){
  if($(el).find('i.up').length > 0){
    $(el).find('i').addClass('down').removeClass('up')
    $(el).closest('.product_details').find(".product_infomation").show()
  }else{
    $(el).find('i').addClass('up').removeClass('down')
    $(el).closest('.product_details').find(".product_infomation").hide()
  }
}

function search_on_enter(evt, el){
  if (evt.keyCode == 13) { 
    $(el).next().click(); 
    $('#navbarResponsive').removeClass('show'); 
    $(document).scrollTop( $("#product_list").offset().top ); 
    return false; 
  }
}
