import forms from './modules/form.js'
import * as opt from "./modules/optimize.js"
import Sliders from './modules/sliders.js'
import  Pagination from './modules/pagination.js'
import  phoneMask from "./modules/mask.js"
import  {ProductsSorter} from "./modules/filters.js"
import  RunFunctions from './modules/pure.js'
import  * as store from "./modules/store.js"

document.addEventListener("DOMContentLoaded", () => {
phoneMask()
forms()
if(document.querySelector('.container-category-view')){
ProductsSorter()
Pagination()
}
RunFunctions(store)
RunFunctions(opt)
Sliders()
})
