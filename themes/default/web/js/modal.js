document.addEventListener('DOMContentLoaded',()=>{
let myModal = new bootstrap.Modal(document.getElementById('ordersuccessModal'), {
				keyboard: false
				})
myModal.show();
setTimeout(function(){
	myModal.hide();
}, 5000);

})