import  Favorite from './favorite.js'
import {ImageTouch,listViewUpdate} from './pure.js'
import  * as store from "./store.js"

const insert = '<div class="spinner-border text-success abs" role="status" id="spinner"></div>'

let imagesUpdate = () => {
    const lazyImages = document.querySelectorAll('img[data-src]')
    if (lazyImages.length) {
        for (let img of lazyImages) {
            img.src = img.dataset.src
			if(img.parentNode.querySelector('.spinner-border')){
            	img.parentNode.querySelector('.spinner-border').remove()
			}
        }
    }
}
let positionUpdate = (selector) => {
    const scrollTarget = document.querySelector(selector)
    const elementPosition = scrollTarget.getBoundingClientRect().top
    window.scrollBy({
        top: elementPosition,
        behavior: 'smooth'
    })
}
let documentLoadStyle = (selector) => {
    setTimeout(() => {
        document.querySelector(selector).classList.remove('updated')
    }, 1000)
}

const SearchAction = () => {
      window.onpopstate = (e) => {
      window.location = location.href;
    }


    let PrivateNav ='.page-link'

    const resultPage = (listBox) => {
            let newsLinks = document.querySelectorAll(PrivateNav)
            if(newsLinks !== null){

                newsLinks.forEach(link => {
                    link.addEventListener('click',(e)=>{
                        e.preventDefault()
                        let el = e.target
                        getData(el,listBox)

                    })
                })
            }
       }

    // Функция пагинации
    const getData = async (el,selector) => {
    const nextPage = await fetch(el.href)
        .then(data => data.text())
        .then(page => {
                page = new DOMParser().parseFromString(page,'text/html')
                document.querySelector(selector).innerHTML = page.querySelector(selector).innerHTML

                positionUpdate(selector)
                document.querySelector(selector).classList.add('updated')
                imagesUpdate()
                documentLoadStyle(selector)
                let new_href = el.href.split('?')[1]
                if(new_href !== undefined){
                      window.history.pushState(
                            null,
                            document.title,
                            `${window.location.pathname}?${new_href}`
                          )
                      }else{
                        window.history.pushState(
                                null,
                                document.title,
                                `${window.location.pathname}`
                              )
                    }
                resultPage(selector)
				Favorite()
				ImageTouch()
				store.AddToCard()
                })


        return nextPage
        }
	if(document.querySelector('.search-list-view')){
    	resultPage('.search-list-view')
	}
}

export  default SearchAction