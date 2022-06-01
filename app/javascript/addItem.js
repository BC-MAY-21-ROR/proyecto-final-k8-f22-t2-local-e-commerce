let images = [];
let container = document.getElementById("upload");

window.loadFiles = function (event) {
  const pictures = event.target.files;
  for (let i = 0; i < pictures.length; i++) {
    images.push(pictures[i]);
  }
  showImages(images);
};

const showImages = (images) => {
  container.innerHTML = "";
  for (let i = 0; i < images.length; i++) {
    let img = `<div class="form_post__container"><img class="form_post__picture output"/><div onclick="deleteImage(${i})" class="form_post__delete"><a class="form_post__delete__icon"><i class="fa-solid fa-trash"></i></a></div></div>`;
    container.innerHTML += img;
    img = document.getElementsByClassName("output");
    img[i].src = URL.createObjectURL(images[i]);
    img[i].style.display = "inline";
  }
};

window.deleteImage = function (position) {
  images.splice(position, 1);
  showImages(images);
};
