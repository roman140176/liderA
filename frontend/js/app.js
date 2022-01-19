import  RunFunctions from './modules/pure.js'
import  Favorite from './modules/favorite.js'
import  MenuMobile from './modules/menu.js'
import OredrForm from "./modules/orderForm.js"
import SearchAction from "./modules/search.js"
import "../sass/style.scss"
document.addEventListener("DOMContentLoaded", () => {
    Favorite()
    OredrForm()
    SearchAction()
    MenuMobile()
  })



