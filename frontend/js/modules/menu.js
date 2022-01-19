const MenuMobile = () => {
    const menuwrap = document.querySelector('#menu_header')
    const fixMenu = document.querySelector('.fix-mobile-menu')
    const toggler = document.querySelector('.menu-toggler')
    const items = menuwrap.querySelectorAll('li')
    const logo = document.querySelector('.site-logo').outerHTML
    const input = document.querySelector('.serch-product').outerHTML
    const serchElement = document.querySelector('.mobile-search')
    const searchProductModal = document.querySelector('#searchProductModal')
    const modalBody = searchProductModal.querySelector('.modal-body')
    let itemsArray = []
    for(let i of items){
    if(!i.closest('.subMenu')){
        itemsArray.push(i.innerHTML)
        }
    }
    fixMenu.innerHTML = `<div class="fix-header d-flex">
                            ${logo}
                            <div class="fix-close"></div>
                        </div>
                        <div class="fix-container">${itemsArray.join('')}</div>`

    toggler.addEventListener('click',(e) => {
         fixMenu.classList.add('active')
    })

    fixMenu.addEventListener('click', e => {
        if(e.target.classList.contains('fix-close')){
            fixMenu.classList.remove('active')
        }
    })
    serchElement.addEventListener('click', e => {
        modalBody.innerHTML = input
    })
}



export default MenuMobile