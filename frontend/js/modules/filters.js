import { slideUp,slideDown,Parsing,listViewUpdate,boxAnimate,selectedFiltersBox,ShowHiddenFilters,cMenu,ImageTouch} from "./pure.js";
import  Pagination from './pagination.js'
import  Favorite from './favorite.js'
import  {AddToCard} from "./store.js"
export let is_Filter = false
export const ProductsSorter = () => {
let name = '.sort-box__list',
    sorterBox = '.sorter',
    formId = 'store-filter',
    selector = '.container-category-view',
    box = '#product-box'


    let showSorterList = (sorterBox) => {
        document.querySelector(sorterBox).addEventListener('click',(ev) => {
        if(!ev.currentTarget.classList.contains('active')){
            ev.currentTarget.classList.add('active')
            slideDown(document.querySelector(name),200)
        }else{
            ev.currentTarget.classList.remove('active')
            slideUp(document.querySelector(name),200)
        }
        })
    }


    let formFilter = async (dataUrl) => {
        const result = await fetch(dataUrl)
              return result.text()
    }

    let filtersUpdate = (formId) => {
        const mediaQuery = window.matchMedia('(min-width: 961px)')
        mediaQuery.addEventListener('change',changesMedia(mediaQuery))
    }


    let sortFilter = (name) => {
        let sorter = document.querySelector(name)
        sorter.addEventListener('click',(e)=>{
            e.stopPropagation()
            if(!e.target.dataset.href){
                return
            }
        let url = location.pathname+e.target.dataset.href
            getData(url)
            .then(data=>{
                data = Parsing(data)
                data.querySelector(sorterBox).querySelector('span').textContent = e.target.textContent
               listViewUpdate('.container-category-view',data)
               selectedFiltersBox(Update)
               document.querySelector(box).classList.add('updated')
            }).then(()=>{
                    boxAnimate(box,selector)
                    Update()
                })
        })
    }
	if(document.querySelector(name)){
    	sortFilter(name)
        showSorterList(sorterBox)
        filtersUpdate(formId)
	}
    async function getData(url) {
        const res = await fetch(url)
        return res.text()
    }


    //


    //

    function Update() {
        sortFilter(name)
        showSorterList(sorterBox)
        filtersUpdate(formId)
        Pagination()
        Favorite()
        ImageTouch()
        AddToCard()
        cMenu()
        Close()
        ShowMobileFilters()
    }
    if(document.querySelector(sorterBox)){
        document.addEventListener('mouseup',ev => {
            let sortContainer = document.querySelector(sorterBox)
            let list = document.querySelector(name)
            if(ev.target !== sortContainer && ev.target !== list){
                slideUp(list,200)
                sortContainer.classList.remove('active')
            }

        })
    }

    const ShowMobileFilters = () => {
            let filterBtns = document.querySelectorAll('.visible-mobile')
            let s
            for(let btn of filterBtns){
                btn.addEventListener('click',(e) => {
                    let target = e.currentTarget,
                        open = target.dataset.open,
                        filter = document.querySelector('#' + open)

                        filter.style.transition = 'all .4s'
                        filter.classList.add('openandactive')
                })
            }

    }
    let Close = () => {
        let close = document.querySelector('.ff-close')
        let categoryClose = document.querySelector('.cm-close')
        if(close){
            close.addEventListener('click',closeParams,false)
            categoryClose.addEventListener('click',closeParams,false)
        }
    }
    function closeParams() {
         document.querySelector('.openandactive').style.transition = 'all .4s'
         document.querySelector('.openandactive').classList.remove('openandactive')
    }
    function changesMedia(e,form){
                form = document.getElementById(formId)
                let ev = e.matches ? 'change' : 'submit'
                if(form){
                    form.addEventListener(ev,(e) => {
                    e.preventDefault()
                        let formUrl = form.action,
                        formdata = new FormData(form),
                        queryString = new URLSearchParams(formdata).toString()
                        let dataUrl = `${window.location.pathname}?${queryString}`
                        formFilter(dataUrl).then(newData=>{
                            newData = Parsing(newData)
                            listViewUpdate('.container-category-view',newData)
                            selectedFiltersBox(Update)
                            ShowHiddenFilters()
                            document.querySelector(box).classList.add('updated')
                            boxAnimate(box,selector)
                            if(queryString !=''){
                                window.history.pushState(
                                null,
                                document.title,
                                `${window.location.pathname}?${queryString}`
                                )
                            }else{
                                window.history.replaceState(
                                null,
                                document.title,
                                `${window.location.pathname}`
                                )
                            }
                            Update()
                            })
                        })
                }
            }
    ShowHiddenFilters()
    cMenu()
    ShowMobileFilters()
    Close()

    if(document.querySelector('.selected-filters')){
        selectedFiltersBox(Update)
        is_Filter = true
    }
}

export default ProductsSorter

