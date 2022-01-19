import { fadeIn, fadeOut, bytesToSize } from "./pure"


export function element(tag, classes = [], content) {
    const node = document.createElement(tag)
    if (classes.length) {
        node.classList.add(...classes)
    }
    if (content) {
        node.textContent = content
    }
    return node
}

const forms = () => {
    const form = document.querySelectorAll('.ajax-form')
    let messageBox = document.getElementById('messmodal')
    let backDrop = '.modal-backdrop'
    let btn = document.querySelectorAll('.js-button')
    let errorCaptcha = 'Пройдите проверку reCAPTCHA...'
    let withPreview = document.querySelector('#MultiFile2_F1')
    let upload_btn = document.querySelector('.upload-box__btn')
    let fileList = document.querySelector('.file-list')
    let files = []
    let buffered = []
    let submited = false
    let newFiles = []
    let results = []
    let preview = element('div', ['preview-wrap','d-flex'])
    let removed = false
    let fileInput = `<input class="multi with-preview form-control"
                    maxlength="20" id="MultiFile2_F1"
                    multiple="multiple" name="image[]"
                    accept="image/*,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                    type="file">`

    const removeHandler = event => {
        if (!event.target.dataset.name) {
            return
        }
        let {name} = event.target.dataset
        files = files.filter(file => file.name !== name)
        newFiles = files.reduce((acc,item,i)=>{
            if(item.name !== name){
                acc.push(item)
            }
            return acc
        },[])
        let block = preview.querySelector(`[data-name="${name}"]`).closest('.preview-image')
        let blocks = preview.querySelectorAll('.preview-image')
        setTimeout(() => block.remove(), 300)
        if (blocks.length <= 1) {
            preview.remove()

        }
        removed =  true
    }
    if(withPreview){
        upload_btn.addEventListener('click',()=>{
            document.querySelector('#MultiFile2_F1').click()
            if (newFiles.length > 0){
                results = [...newFiles]
            }
        })
        fileList.innerHTML = ''
        withPreview.addEventListener('change',(event) => {
            files = Array.from(event.target.files)
            files.forEach((file) => {

                if (!event.target.files.length) {
                    return
                }
                const reader = new FileReader()

                reader.onload = ev => {
                    let previewImage = `<div class="preview-image">
                    <div class="delete-image" data-name="${file.name}">&times;</div>
                    <div class="image-info">
                    <span>${file.name}</span>
                    <span>${bytesToSize(file.size)}</span>
                    </div>
                    </div>`

                    preview.insertAdjacentHTML('afterbegin', previewImage)
                    fileList.insertAdjacentElement('afterbegin', preview)

                }


                reader.readAsDataURL(file)
            })
        })
    preview.addEventListener('click', removeHandler)
    }



    let promise = () => {
    return new Promise((res,_) => {
        setTimeout(() => {
            resolve()
        }, 1000);

    })

    }

    // Проверка в модалке форма или нет
    let modalsWrap = (item) => {
        return item.closest('.modal-content')
    }


    // функция закрытия окна формы, если форма в модалке
    let modalClose = (item) => {
        if(modalsWrap(item)){
            setTimeout(() => {
                item.closest('.modal').style.display = "none"
                item.closest('.modal').classList.remove('show')
                document.querySelector(backDrop).style.display = "none"
                document.querySelector(backDrop).classList.remove('show')
                btn.forEach((b) => {
                    if (b.dataset.bsTarget == `#${item.closest('.modal').id}`) {
                        b.click()
                    }
                })
            }, 300);

        }
    }
    // Функция отправки данных
    const postData = async (url, data) => {

        let res = await fetch(url,{
            method:"POST",
            body: data,
            headers:{
                'x-requested-with' : 'XMLHttpRequest'
            }
        })

        return await res.text()
    }

    const isSuccess = (form) => {
        fadeIn(messageBox)
        document.body.setAttribute('style','')
        document.body.classList.remove('modal-open')
        let widget_id = form.querySelector('.g-recaptcha').dataset.widgetId
        setTimeout(()=>{
            fadeOut(messageBox)
            form.reset()
            grecaptcha.reset(widget_id)
        },400)


    }

    // Проверка заполнены ли инпуты  с обязательными полями
    let emptyRequaredInput = (item)=>{
        let inputs = item.querySelectorAll('.form_field')
        let empty = false
        inputs.forEach(el => {
            if (el.previousElementSibling.classList.contains('required') && el.value.trim() ==''){
               empty  =  true

            }
        })
        return empty
    }
    let changeRequaredInput = (item)=>{
        let inputs = item.querySelectorAll('.form_field')
        inputs.forEach(el => {
            if (el.previousElementSibling.classList.contains('required') && el.value.trim() ==''){
               el.nextElementSibling.textContent = `Поле ${el.dataset.name} должно быть заполнено`
            }else{
                if (el.nextElementSibling){
                el.nextElementSibling.textContent = ''
                }
            }
        })
    }


    let verifyCode = (item) => {
        let widget_id = item.querySelector('.g-recaptcha').dataset.widgetId
        if (grecaptcha.getResponse(widget_id) == ''){
           item.querySelector('.capcha-error').textContent = errorCaptcha
        }
    }

    let isCaptchaChecked = (item) => {
      let widget_id = item.querySelector('.g-recaptcha').dataset.widgetId
        return grecaptcha && grecaptcha.getResponse(widget_id).length !== 0;
    }
    document.querySelectorAll('.form_field').forEach(el => {
        el.addEventListener('change',() => {
            if (el.previousElementSibling.classList.contains('required') && el.value.trim() == '') {
                el.nextElementSibling.textContent = `Поле ${el.dataset.name} должно быть заполнено`
            } else {
                if (el.nextElementSibling) {
                    el.nextElementSibling.textContent = ''
                }
            }
        })
    })
    form.forEach(item => {
        item.addEventListener('submit',(e) => {
            e.preventDefault()

            changeRequaredInput(item)
            verifyCode(item)
            if (!emptyRequaredInput(item) && isCaptchaChecked(item)) {
                let newfiles = results.length>0 ? files.concat(...results) : files
                if (removed){
                    withPreview.remove()
                }
                let formData = new FormData(item)
                const action = item.action
                if (removed) {
                    for (let nf of newfiles) {
                        formData.append('image[]', nf)
                    }
                }

            postData(action,formData)
            .then((res) => {
                modalClose(item)
                isSuccess(item)
                return res
                }).then((res) => {
                    if(removed){
                        setTimeout(() => {
                            location.reload()
                        }, 4000);
                    }

                })
            }

        })
    })

}
export default forms