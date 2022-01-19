const RunFunctions = (obj) => {
    for (let key in obj) {
          if(obj.hasOwnProperty(key) && typeof(obj[key]) === 'function'){
            obj[key]()
          }
        }
}
export const bytesToSize = (bytes) => {
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (!bytes) return '0 Byte';
    let i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}

export async function file_get_contents(url,selector) {
    let res = await fetch(url)
    .then(data=>data.text())
     document.querySelector(selector).insertAdjacentHTML('afterBegin',res)
  }

/* SLIDE UP */
export let slideUp = (target, duration = 500) => {

  target.style.transitionProperty = 'height, margin, padding';
  target.style.transitionDuration = duration + 'ms';
  target.style.boxSizing = 'border-box';
  target.style.height = target.offsetHeight + 'px';
  target.offsetHeight;
  target.style.overflow = 'hidden';
  target.style.height = 0;
  target.style.paddingTop = 0;
  target.style.paddingBottom = 0;
  target.style.marginTop = 0;
  target.style.marginBottom = 0;
  window.setTimeout(() => {
    target.style.display = 'none';
    target.style.removeProperty('height');
    target.style.removeProperty('padding-top');
    target.style.removeProperty('padding-bottom');
    target.style.removeProperty('margin-top');
    target.style.removeProperty('margin-bottom');
    target.style.removeProperty('overflow');
    target.style.removeProperty('transition-duration');
    target.style.removeProperty('transition-property');
    //alert("!");
  }, duration);
}

/* SLIDE DOWN */
export let slideDown = (target, duration = 500) => {

  target.style.removeProperty('display');
  let display = window.getComputedStyle(target).display;
  if (display === 'none') display = 'block';
  target.style.display = display;
  let height = target.offsetHeight;
  target.style.overflow = 'hidden';
  target.style.height = 0;
  target.style.paddingTop = 0;
  target.style.paddingBottom = 0;
  target.style.marginTop = 0;
  target.style.marginBottom = 0;
  target.offsetHeight;
  target.style.boxSizing = 'border-box';
  target.style.transitionProperty = "height, margin, padding";
  target.style.transitionDuration = duration + 'ms';
  target.style.height = height + 'px';
  target.style.removeProperty('padding-top');
  target.style.removeProperty('padding-bottom');
  target.style.removeProperty('margin-top');
  target.style.removeProperty('margin-bottom');
  window.setTimeout(() => {
    target.style.removeProperty('height');
    target.style.removeProperty('overflow');
    target.style.removeProperty('transition-duration');
    target.style.removeProperty('transition-property');
  }, duration);
}

/* TOOGLE */
export let slideToggle = (target, duration = 500) => {
  if (window.getComputedStyle(target).display === 'none') {
    return slideDown(target, duration);
  } else {
    return slideUp(target, duration);
  }
}

export let  fadeIn = (el,num = 10) => {
  let opacity = 0.01
  el.style.display = "block"
  let timer = setInterval(function () {
    if (opacity >= 1) {
      clearInterval(timer)
    }
    el.style.opacity = opacity
    opacity += opacity * 0.1
  }, num)

}

export let  fadeOut = (el,num = 10) => {
  var opacity = 1
  var timer = setInterval(function () {
    if (opacity <= 0.1) {
      clearInterval(timer);
      el.style.display = "none"
    }
    el.style.opacity = opacity
    opacity -= opacity * 0.1
  }, num)
}
export let Parsing = (elem) => {
        return new DOMParser().parseFromString(elem,'text/html')
    }


export let listViewUpdate = (selector,data) => {
document.querySelector(selector).innerHTML = data.querySelector(selector).innerHTML
    let productBox = document.querySelector(selector)
    productBox.querySelectorAll('img[data-src]').forEach(item=>{
        item.src = item.dataset.src
        if(item.nextElementSibling !== null){
            item.nextElementSibling.remove()
        }
    })

}

export let boxAnimate = (box,selector) => {
  setTimeout(() => {
      document.querySelector(box).classList.remove('updated')
  }, 1000)
  window.scrollBy({
  top: document.querySelector(selector).getBoundingClientRect().top,
  behavior: 'smooth'
  })
}
let formFilter = async (dataUrl) => {
        const result = await fetch(dataUrl)
              return result.text()
    }

export  function selectedFiltersBox(func) {
    let filterInputs = document.querySelectorAll('.filter-input[checked="checked"]')
    let selectedFilters = document.querySelector('.selected-filters')
    let selectedBox = []
    let formUrl = window.location.pathname
    console.log('ok');
    filterInputs.forEach(item => {
        let {id} = item
        let title = item.dataset.title
        let label = item.nextElementSibling.textContent
        selectedBox.push(`<div class="select-filter-item" id="item-${id}">${title}:${label}<span></span></div>`)
        })
    selectedFilters.innerHTML = `<div class="wr d-flex"><div class="selected-title">Выбрано</div>
                                    <div class="select-flex">${selectedBox.join('')}</div>
                                    <div class="reset-filters">Сбросить фильтры<span></span></div></div>`
    if(!filterInputs.length){
        selectedFilters.innerHTML = ''
        }
      selectedFilters.addEventListener('click',(e) => {
      if(e.target.id){
          let id = e.target.id.split('-')[1]
          const mediaQuery = window.matchMedia('(min-width: 961px)')
          if(document.querySelector('#' + id).checked){
            document.querySelector('#' + id).nextElementSibling.click()
          }
          if (!mediaQuery.matches){
              document.querySelector('.params-close').click()
            }
          }
        if(e.target.classList.contains('reset-filters')){

            let form = document.getElementById('store-filter')

                formFilter(formUrl).then(newData=>{
                    newData = Parsing(newData)
                    listViewUpdate('.container-category-view',newData)
                    document.querySelector('#product-box').classList.add('updated')
                    boxAnimate('#product-box','.container-category-view')
                     window.history.replaceState(
                                null,
                                document.title,
                                `${window.location.pathname}`
                                )

                    ShowHiddenFilters()
                      func()
                    })


        }
      })
    }

export const ShowHiddenFilters = () =>{

   let smf = document.querySelectorAll('.show-more-filters')
   smf.forEach(btn => {
   let _hiddens = []
    btn.addEventListener('click',(e)=>{
      let el = e.target,
      wrapp = e.target.closest('.filter-div'),
      hiddenCheckboxes = wrapp.querySelectorAll('.hidden')
       if(!_hiddens.length){
                for(let item of hiddenCheckboxes){
                    slideDown(item)
                    _hiddens.push(item)
                }
                el.textContent = 'Свернуть'
            }else{
                for(let item of _hiddens){
                  slideUp(item,400)
                }
                el.textContent = 'Показать ещё'
                _hiddens = []
            }
    })

   })

}

   export let cMenu = () => {
    let parent_item = document.querySelectorAll('.parent-item')
    let child__item = document.querySelectorAll('.c-child__item')
        for(let item of parent_item){
            let parentLink = item.querySelector('.catparent-link')
            if(parentLink.classList.contains('active')){
                parentLink.nextElementSibling.style.cssText = 'display:block;border-bottom:1px solid #D9DDE8'
            }
        }
        for(let link of child__item){
            if(link.classList.contains('active')){
                link.closest('.categorychild-box').style.cssText = 'display:block;border-bottom:1px solid #D9DDE8'
            }
        }
   }

   export const ImageTouch = () => {
    const touchbox = document.querySelectorAll('.array-touch')
      touchbox.forEach((item,index)=>{
        let w = item.offsetWidth
        let psevdo = item.querySelectorAll('.psevdo')
        psevdo.forEach((p,i)=>{
        let wd = w / psevdo.length
          p.style.cssText = `width:${wd}px;left:${wd * i}px`
          // p.addEventListener('touchmove',ev => {
          //   changeImage(ev,p,item)
          // })
          p.addEventListener('mousemove',ev => {
            changeImage(ev,p,item)
          })
        })
      })

   }

    function changeImage(ev,p,item){
      let image = ev.target.dataset.image
            let wrap = p.closest('.array-touch')
            let imageboxes = wrap.querySelectorAll('.array_image')
            let nmg = item.querySelector('.nan-img')
            let bullet = nmg.querySelectorAll('span')
            for(let i = 0; i<imageboxes.length;i++){
              imageboxes[i].classList.remove('hovered')
              bullet[i].classList.remove('hovered')
              }
            item.querySelector('#'+image).classList.add('hovered')
            item.querySelector('span[data-active='+image+']').classList.add('hovered')
    }


export default RunFunctions