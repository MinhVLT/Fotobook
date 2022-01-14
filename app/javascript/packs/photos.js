$('document').ready(function () {
  $('input#upload-button').on(
    'change', function () {
      previewPhoto(this);
    }
  )
})

function previewPhoto(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function (e) {
      const imagePhoto = document.createElement("img")
      imagePhoto.setAttribute("src", e.target.result)
      imagePhoto.setAttribute("width", "180")
      imagePhoto.setAttribute("height", "180")
      $('.new-photo .photo-upload-border i').remove()
      $('.new-photo .photo-upload-border img').remove()
      $('.new-photo .photo-upload-border').prepend(imagePhoto)
    };
    reader.readAsDataURL(input.files[0]);
  }
}