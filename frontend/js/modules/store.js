import { slideUp,slideDown} from "./pure.js";
let quantityInputElement = document.querySelector('#product-quantity-input')
let increase = document.querySelector('.product-quantity-increase')
let cart_increase = document.querySelectorAll('.cart-quantity-increase')
let decrease = document.querySelector('.product-quantity-decrease')
let cart_decrease = document.querySelectorAll('.cart-quantity-decrease')
let cartCount = document.querySelectorAll('.cart-counter')
let cmc_root = document.querySelectorAll('.cmc-roots__item')
let cmc_children = document.querySelectorAll('.cmc-children__box')
const AddToCard = () => {
    let buuton = document.querySelectorAll('.but-add-cart')
    let succsess = 'В корзине'
    let spiner = `<div class="btn-spinner spinner-border text-danger" role="status">
                    <span class="visually-hidden">Loading...</span>
                  </div>`

    buuton.forEach(btn=>{
        btn.addEventListener('click',function(e){
            e.preventDefault()
            let form = e.currentTarget.closest('form')
            const isQuantity = () => {
                    if(form.querySelector('#product-quantity-input')){
                        return parseInt(form.querySelector('#product-quantity-input').value)
                    }
                    return 1
                }

            const isVAriant = () => {
                    if(form.querySelector('#product-quantity-input')){
                        let columns = form.querySelectorAll('.products-inp_col')
                        let strs = ''
                        for(let column of columns){
                            let input = column.querySelector('input')
                            if(input.checked){
                                strs = `&${input.name}=${input.value}`
                            }
                        }
                        return strs
                    }
                    return
                }
            let el = this
            let url = this.dataset.url
            let product = this.dataset.id
            let xhr = new XMLHttpRequest();
            let post_data =  `Product[id]=${product}&Product[quantity]=${isQuantity()}${isVAriant()}&YUPE_TOKEN=${yupeToken}`
            xhr.open("POST",url,true)
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
            xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
            xhr.onload = function() {
                let res = JSON.parse(xhr.response)
                cartCount.forEach(item=>{
                item.innerHTML = res.count
                })
                el.querySelector('span').textContent=''
                if(el.querySelector('svg')){
                    el.querySelector('svg').classList.add('actived')
                    }
                el.insertAdjacentHTML('afterbegin',spiner)
                setTimeout(function(){
                    el.querySelector('.spinner-border').remove()
                    el.querySelector('span').textContent= succsess
                    if(el.querySelector('svg')){
                    el.querySelector('svg').classList.remove('actived')
                    }
                    //el.classList.add('added')
                },1000)
            }
            xhr.send(post_data)
        })
    })
}

const RenderCatalogMenu = () => {
    const cb = document.querySelector('.catalog-button')
    const menu = document.querySelector('.catalog-menu-container')
    cb.addEventListener('click',(e) => {
    let el = e.currentTarget
    if(!el.classList.contains('active')){
        el.classList.add('active')
        slideDown(menu,300)
        }else{
            el.classList.remove('active')
            slideUp(menu,300)
            }
        })

    document.addEventListener('mouseup',ev => {
            const cb = document.querySelector('.catalog-button')
            const menu = document.querySelector('.catalog-menu-container')
            const span = document.querySelector('.span-catalog')
            if(ev.target !== cb && ev.target !== span){
                slideUp(menu,200)
                cb.classList.remove('active')
            }

        })
    }



const SelectProductQuantity = () => {
    if(increase){
        increase.addEventListener('click',(e) => {
            quantityInputElement.value = parseInt(quantityInputElement.value) + 1
        })
        decrease.addEventListener('click',(e) => {
            if(parseInt(quantityInputElement.value) > 1){
            quantityInputElement.value =  parseInt(quantityInputElement.value) - 1
            }
        })
    }
}
const SelectCartQuantity = () => {
    if(cart_increase){
        for(let inc of cart_increase){
            inc.addEventListener('click',(e) => {
            let positionCountEl = document.querySelector(e.currentTarget.dataset.target)
            let el = positionCountEl.closest('.cart-list__item')
            let productId =el.querySelector('.position-id').value
            positionCountEl.value = parseInt(positionCountEl.value) + 1
            updataCart(positionCountEl,productId)
            })
        }
        for(let inc of cart_decrease){
            inc.addEventListener('click',(e) => {
            let positionCountEl = document.querySelector(e.currentTarget.dataset.target)
            let el = positionCountEl.closest('.cart-list__item')
            let productId =el.querySelector('.position-id').value
            if(parseInt(positionCountEl.value)>=1){
                positionCountEl.value = parseInt(positionCountEl.value) - 1
            }
            updataCart(positionCountEl,productId)
            })
        }
    }

    function updataCart(positionCountEl,productId) {
        let quantity = parseInt(positionCountEl.value)
        let xhr = new XMLHttpRequest();
        let data =  `quantity=${quantity}&id=${productId}&YUPE_TOKEN=${yupeToken}`
            xhr.open("POST",yupeCartUpdateUrl,true)
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
            xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
                xhr.onload = function() {
            let res = JSON.parse(xhr.response)
            cartCount.forEach(item=>{
                item.innerHTML = res.count
                })
        }
            xhr.send(data)
    }
}

const Variants = () => {
    let inpotboxes = document.querySelectorAll('.products-inp_col')
    function addActiveClass(){
        for(let col of inpotboxes){
        let input = col.querySelector('input')
            if(input.checked){
            let label = col.querySelector('label')
            let text = label.dataset.color
            document.querySelector('.v-name').textContent = text
            col.classList.add('active')
            }else{
                col.classList.remove('active')
            }
        }

    }
    for(let col of inpotboxes){
        col.addEventListener('click',()=>{
            let label = col.querySelector('label')
            label.click()
            addActiveClass()
        })
        }
    addActiveClass()
}

const ExpandButton = () => {
    let hids = document.querySelectorAll('.no-visible-part')
    let expand = document.querySelectorAll('.expand')
	if(hids.length){
        expand.forEach(item=>{
            let oldText = item.textContent
            item.addEventListener('click',(e)=>{
                let elem = e.currentTarget
                let novisible = elem.closest('.product-main-description')
                .querySelector('.no-visible-part')
                if(elem.textContent == oldText){
                    slideDown(novisible,400)
                    elem.textContent = 'Свернуть'
                }else{
                slideUp(novisible,400)
                    elem.textContent = oldText
                }
            })
        })
	}
}
const DeletePosition = () => {
   if(document.querySelectorAll('.js-cart__delete').length){
        let dp = document.querySelectorAll('.js-cart__delete')
        let url = yupeCartDeleteProductUrl
        for(let bt of dp){
            bt.addEventListener('click',ev=>{
                let el = ev.currentTarget
                let data = `id=${el.dataset.position}&YUPE_TOKEN=${yupeToken}`
                let xhr = new XMLHttpRequest()
                xhr.open("POST",url,true)
                    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
                    xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
                    xhr.onload = function() {
                        let res = JSON.parse(xhr.response)
                        cartCount.forEach(item=>{
                        item.innerHTML = res.count
                        })
                        el.closest('.cart-list__item').remove()
                        if(!document.querySelectorAll('.cart-list__item').length){
                            document.querySelector('.cart-title').innerHTML = 'Ваша корзина пуста'
                            document.querySelector('#order-form').remove()
                        }
                    }
                    xhr.send(data)
            })
        }
   }
}

const CatalogRoot = () => {
        for(let root of cmc_root){
            root.addEventListener('mouseenter',e => {
                let el = e.currentTarget,
                    child = el.dataset.child,
                    chidrens = document.querySelector(child)
                    itemClassRemove(cmc_root,'active')
                    itemClassRemove(cmc_children,'active')
                    el.classList.add('active')
                    chidrens.classList.add('active')
            })
        }
        function itemClassRemove(items,itemClass){
        for(let i of items){
            i.classList.remove(itemClass)
        }
    }

}



export {
AddToCard,
SelectProductQuantity,
Variants,
ExpandButton,
DeletePosition,
SelectCartQuantity,
CatalogRoot,
RenderCatalogMenu
}