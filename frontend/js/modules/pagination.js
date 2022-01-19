import  {is_Filter, ProductsSorter} from "./filters.js"
import  Favorite from './favorite.js'
import  {AddToCard} from "./store.js"
import { slideUp,slideDown,Parsing,listViewUpdate, boxAnimate,selectedFiltersBox,ShowHiddenFilters,cMenu,ImageTouch} from "./pure.js";
const Pagination = () => {

      window.onpopstate = (e) => {
      window.location = location.href;
    }
    let PrivateNav ='.page-link'
    let box = '#product-box'
    let selector = '.container-category-view'
    let hiddens = []
    const paginatorPage = (listBox) => {
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
                page =  Parsing(page)
                document.querySelector(selector).innerHTML = page.querySelector(selector).innerHTML
                listViewUpdate(selector,page)
                selectedFiltersBox(UpdateAll)
                ShowHiddenFilters()
                document.querySelector(box).classList.add('updated')
                }).then(()=>{
                    boxAnimate(box,selector)
                    UpdateAll()
                    let new_href = el.href.split('?')[1]
                    if(new_href !== undefined){
                        window.history.pushState(
                                null,
                                document.title,
                                `${location.pathname}?${new_href}`
                            )
                    }else{
                         window.history.replaceState(
                                null,
                                document.title,
                                `${location.pathname}`
                              )

                    }
                })
        }

     paginatorPage('.container-category-view')
     let active = document.querySelectorAll('.countItem-wrapper__link')
     let span = document.querySelector('.active-number')
     selectCount()


    async function fetchCount(url) {
        const params = await fetch(url)
        return params.text()
    }

    function selectCount() {
        let active = document.querySelectorAll('.countItem-wrapper__link')
        let span = document.querySelector('.active-number')
        let formUrl = document.getElementById('store-filter').action,
                formdata = new FormData(document.getElementById('store-filter')),
                queryString = new URLSearchParams(formdata).toString(),
                url = `${location.href}`
       for(let item of active){
            item.addEventListener('click',(e)=>{
                let count = e.target.dataset.count
                for(let item of active){
                    item.classList.remove('active')
                }
                e.target.classList.add('active')
                span.textContent = e.target.textContent
                document.cookie = `store_count=${count};path=/`
                fetchCount(url).then(params => {
                params =  Parsing(params)
                listViewUpdate('.container-category-view',params)
                selectedFiltersBox(UpdateAll)
                ShowHiddenFilters()
                document.querySelector('.active-number').textContent = e.target.textContent
                document.querySelector(box).classList.add('updated')
                }).then(()=>{
                    boxAnimate(box,selector)
                    UpdateAll()

                })
            })
            if(item.classList.contains('active')){
                span.textContent = item.textContent
            }
        }
    }
    showCounters()

    function showCounters() {
        let counterWrapp = document.querySelector('.countItem-wrapper')
        counterWrapp.addEventListener('click',(e)=>{
        const elem = e.currentTarget
        const block = elem.querySelector('.cw-list')
        if(!elem.classList.contains('active')){
                elem.classList.add('active')
                slideDown(block,400)
        }else{
            elem.classList.remove('active')
            slideUp(block,400)
        }
        })
    }

    function UpdateAll() {
        paginatorPage('.container-category-view')
        ProductsSorter()
        selectCount()
        showCounters()
        Favorite()
        ImageTouch()
        AddToCard()
        cMenu()
    }
    if(document.querySelector('.countItem-wrapper')){
        document.addEventListener('mouseup',ev => {
            let cw = document.querySelector('.countItem-wrapper')
            let list = document.querySelector('.cw-list')
            if(ev.target !== cw){
                slideUp(list,200)
                cw.classList.remove('active')
            }

        })
    }
    if(!is_Filter){
        selectedFiltersBox(UpdateAll)
    }
}

export default Pagination