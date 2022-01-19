import WinBox from 'winbox/src/js/winbox.js'
const captcha = 'https://www.google.com/recaptcha/api.js?onload=CaptchaCallback&render=explicit&hl=en"'
const address = "https://yandex.ru/map-widget/v1/?um=constructor%3Acc1b87035ca095a9ef872ed3aedd45f25661369f196e81f509be03123aa1f2a0&amp;source=constructor"
const insert = '<div class="spinner-border text-success abs" role="status" id="spinner"></div>'
const toggleMap = document.querySelector('.show-map')
const mapIframe = `<iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3Acc1b87035ca095a9ef872ed3aedd45f25661369f196e81f509be03123aa1f2a0&amp;source=constructor" width="100%" height="600" frameborder="0"></iframe>`
let flag = false
const getScript = (url,as=false)=>{
        const js_script = document.createElement('script')
        js_script.type = "text/javascript"
        js_script.src = url
        if(!flag){
        document.getElementsByTagName('head')[0].appendChild(js_script)
            flag = true
        }

    }

const JSButton = () => {
    let btn = document.querySelectorAll('.js-button')
    btn.forEach((item)=>{
        item.addEventListener('click',(e)=>{
            e.preventDefault()
            getScript(captcha,false)
        })
    })
}
const scrollForm = () => {
    let form_static = document.querySelector('.form-static')
     let scrolling = true
    document.addEventListener('scroll', () => {
        if (scrolling && form_static){
            let formPos = form_static.getBoundingClientRect().top
            let current = document.documentElement.scrollTop
            if (current >= formPos) {
                getScript(captcha, false)
            }
        }
    })

}
const lazyloadArray = () => {
    const lazyImages = document.querySelectorAll('img[data-src],sorce[data-srcset]')
    const windowHeight = document.documentElement.clientHeight

    let lazyImagesPositions = []
    if(lazyImages.length>0){
       lazyImages.forEach(img=>{
        if(img.dataset.src || img.dataset.srcset){
            lazyImagesPositions.push(img.getBoundingClientRect().top + pageYOffset)
            lazyScrollCheck()
        }
       })
    }

    window.addEventListener('scroll',lazyScroll)

    function lazyScroll(){
        if(document.querySelectorAll('img[data-src],sorce[data-srcset]').length>0){
            lazyScrollCheck()
        }
    }
    function lazyScrollCheck(){
        let imgIndex = lazyImagesPositions.findIndex(
            item => pageYOffset > item - windowHeight
            )
        if(imgIndex>=0){
            if(lazyImages[imgIndex].dataset.src){
               lazyImages[imgIndex].src = lazyImages[imgIndex].dataset.src
               lazyImages[imgIndex].removeAttribute('data-src')
               if(lazyImages[imgIndex].parentNode.querySelector('.spinner-border') !== null){
                    lazyImages[imgIndex].parentNode.querySelector('.spinner-border').remove()
               }
            }else if(lazyImages[imgIndex].dataset.srcset){
                lazyImages[imgIndex].srcset = lazyImages[imgIndex].dataset.srcset
                lazyImages[imgIndex].removeAttribute('data-srcset')
            }
        }
        delete lazyImagesPositions[imgIndex]
    }
}

const ShowMap = () => {
    toggleMap.addEventListener('click',(e) => {
        e.preventDefault()
        let mapBox = new WinBox("Адрес офиса на карте", {
            url: address,
            x: "center",
            y: "10%",
            height:'70%'
        });
       mapBox.dom.classList.add('green')
       mapBox.dom.querySelector('.wb-body').insertAdjacentHTML('afterbegin',insert)
       document.querySelector('.wb-full').style.display="none"
    })
}

const FileSize = () => {
    const bytesToSize = (bytes) => {
       const sizes = ['Бит', 'Кб', 'Мб', 'Гб', 'Тб']
       if (!bytes) return '0 Byte'
       let i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)))
       return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i]
    }
    let link = document.querySelector('.pdf-link')
    if (link !== null) {
        let href = link.href
        let text = link.textContent
        let req = new XMLHttpRequest()
        req.open('GET',href,true)
        req.send()
        let ext = href.split('.')
        let L = ext.length-1
        let extName = ext[L]
        req.onreadystatechange = function() {
          if(this.readyState == this.HEADERS_RECEIVED) {
            let size = parseFloat(req.getResponseHeader('Content-length'))
            link.textContent = `${text} (${bytesToSize(size)},${extName})`
          }
        }

    }


}
const insertCatalogLink = () => {
    let foterItems = document.querySelectorAll('.footer__links')[0]
    let catalogLink = `<div class="footer-item-link"><a href="/store">Продукция</a></div>`
    foterItems.insertAdjacentHTML('afterbegin',catalogLink)
}



export  {lazyloadArray,JSButton, FileSize, ShowMap, insertCatalogLink};