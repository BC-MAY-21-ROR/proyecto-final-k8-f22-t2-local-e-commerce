let images = [];
let container = document.getElementById("upload");

window.loadFiles = function(event) {
<<<<<<< HEAD
  const pictures = event.target.files;
  for(let i=0; i<pictures.length; i++) {
    images.push(pictures[i]);
  }
  showImages(images);
}

const showImages = (images) => {
  container.innerHTML = ''
  for (let i = 0; i < images.length; i++) {
    let img = `<div class="form_new_post__container"><img class="form_new_post__picture output"/><div onclick="deleteImage(${i})" class="form_new_post__delete"><a class="form_new_post__delete__icon"><i class="fa-solid fa-trash"></i></a></div></div>`;
    container.innerHTML += img;
    img = document.getElementsByClassName('output');
    img[i].src = URL.createObjectURL(images[i]);
    img[i].style.display = 'inline';
=======
	const pictures = event.target.files;
	
	for(let i=0; i<pictures.length; i++) {
		images.push(pictures[i]);
	}
	
	showImages(images);
}

const showImages = (images) => {
	container.innerHTML = ''
	for (let i = 0; i < images.length; i++) {
		let img = `<div class="form_new_post__container"><img class="form_new_post__picture output"/><div onclick="deleteImage(${i})" class="form_new_post__delete"><a class="form_new_post__delete__icon"><i class="fa-solid fa-trash"></i></a></div></div>`;
		container.innerHTML += img;
		img = document.getElementsByClassName('output');
		img[i].src = URL.createObjectURL(images[i]);
		img[i].style.display = 'inline';
>>>>>>> da730192c686c0cec50b94efe5e05103a3375c87
	}
}

const removeChilds = (imgs) => {
	imgs = document.getElementsByClassName('output');
<<<<<<< HEAD
  let parent = imgs[0].parentNode;
	let size = imgs.length;
  for (let key = 0; key <= size; key++) {
    parent.removeChild(parent.lastChild);
  }
=======
	let parent = imgs[0].parentNode;
	let size = imgs.length;
	for (let key = 0; key <= size; key++) {
		parent.removeChild(parent.lastChild);
	}
>>>>>>> da730192c686c0cec50b94efe5e05103a3375c87
}

window.deleteImage = function(position) {
	images.splice(position, 1);
	showImages(images);
}
