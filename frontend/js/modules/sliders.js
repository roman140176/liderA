import Swiper from 'swiper/swiper-bundle.js'
import {ImageTouch} from './pure.js'
const Sliders = () => {
    const hasBlock = (selector) => {
      return document.querySelector(selector) == null
    }

    if(!hasBlock('.main-slider')){
        const topSlider = new Swiper(".main-slider",{
        slidesPerView:1,
        speed: 2000,
        spaceBetween: 14,
          pagination: {
          el: ".swiper-pagination",
          dynamicBullets: true,
          },
          navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        }
        })

    }


    if(!hasBlock('.home-product-box')){
      const newProd = new Swiper(".home-product-box",{
        slidesPerView:5,
        speed: 1000,
          breakpoints: {
            1281: {
            slidesPerView:5
            },
            1000: {
            slidesPerView:4
            },
            767: {
            slidesPerView:3
            },
            480: {
            slidesPerView:2
            },
            240: {
            slidesPerView:1
            },
          },
          spaceBetween: 20,
          navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      })

    }
    if (!hasBlock('.array-touch')) {
      ImageTouch()
    }

     if(!hasBlock('.sliders-thumbs')){
      const thumbsSlider = new Swiper(".sliders-thumbs",{
        slidesPerView:5,
        speed: 1000,
        spaceBetween: 14,
        direction:'vertical',
        preloadImages: true,
        lazy: true,
         navigation: {
          nextEl: ".pt-button-next",
          prevEl: ".pt-button-prev",
        }
      })

      const mainimage = new Swiper(".sliders-product-main",{
        slidesPerView:1,
        speed: 1000,
        spaceBetween: 14,
        preloadImages: false,
        effect: 'fade',
        fadeEffect: {
          crossFade: true
        },
        lazy: true,
        thumbs: {
          swiper: thumbsSlider
        }

      })
    }



}

export default Sliders

