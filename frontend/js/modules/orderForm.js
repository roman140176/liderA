import { slideUp,slideDown} from "./pure.js"
const form = document.querySelector('.order-form')
const span = `<span class="required">*</span>`
const OredrForm = () => {
const SelectDelivery = () => {
		const radios = document.querySelectorAll('.rich-radio__input')
		if(radios.length){
			for(let item of radios){
				item.addEventListener('change',e=>{
				let val = e.currentTarget.value
				let block = document.querySelector('#field-strit')
				let label = block.querySelector('label')
				if(val == '2'){
						label.insertAdjacentHTML('beforeend',span)
						label.classList.add('required')
						slideDown(block,400)
				}else{
					slideUp(block,400)
					label.querySelector('.required').remove()
					label.classList.remove('required')
				}
				})
			}
		}
	}
	SelectDelivery()
	const validate = (form) => {
		let inputs = form.querySelectorAll('.form_field')
		for(let i of inputs){
			i.addEventListener('change',e=>{
				let label = i.previousElementSibling
				if(label.classList.contains('required') && i.value.trim() ==''){
					i.nextElementSibling.textContent = `Поле ${i.dataset.name} должно быть заполнено`

				}else{
					if (i.nextElementSibling){
						i.nextElementSibling.textContent = ''
						}
				}
			})
		}
	}
	const validateOnSabmit = (form) => {
		let inputs = form.querySelectorAll('.form_field')
		for(let i of inputs){
				let label = i.previousElementSibling
				if(label.classList.contains('required') && i.value.trim() ==''){
					i.nextElementSibling.textContent = `Поле ${i.dataset.name} должно быть заполнено`

				}else{
					if (i.nextElementSibling){
						i.nextElementSibling.textContent = ''
						}

				}
		}
	}
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
	if(form){
		validate(form)
		form.addEventListener('submit',(e)=>{
			const formdata = new FormData(form)
			const url = form.action
			validateOnSabmit(form)
			if(!emptyRequaredInput(form)){
				return true
			}else{
				e.preventDefault()
				return false
			}
		})
	}

	if(document.querySelector('#check-agreement')){
		document.querySelector('#check-agreement').addEventListener('change',e=>{
			if(!e.currentTarget.checked){
				document.querySelector('.but-order-submit').classList.add('disabled')
			}else{
				document.querySelector('.but-order-submit').classList.remove('disabled')
			}
		})
	}


}

export default OredrForm