$('document').ready(function () {
  $('input#picture_url').on(
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
      $('.new-album .preview-photo-upload .nested-fields .album-upload-border i').remove()
      $('.new-album .preview-photo-upload .nested-fields .album-upload-border img').remove()
      $('.new-album .preview-photo-upload .nested-fields .album-upload-border').prepend(imagePhoto)
    };
    reader.readAsDataURL(input.files[0]);
  }
}