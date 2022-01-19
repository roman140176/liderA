const Favorite = () => {
    let yupeStoreAddFavoriteUrl = '/favorite/add'
    let yupeStoreRemoveFavoriteUrl = '/favorite/remove'

    let svg_remove  = `<svg width="19" height="16" viewBox="0 0 19 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.14758 0.975406C8.23666 1.04179 8.32405 1.1112 8.40969 1.18357C8.74547 1.46734 9.05441 1.79669 9.33333 2.16828C9.61236 1.7967 9.92122 1.46736 10.257 1.1836C10.3427 1.11122 10.4301 1.0418 10.5192 0.975406C11.3878 0.3282 12.3746 0 13.4521 0C14.8937 0 16.2197 0.556101 17.186 1.56581C18.1409 2.56372 18.6667 3.92701 18.6667 5.40473C18.6667 6.92567 18.0785 8.31791 16.8154 9.78616C15.6855 11.0997 14.0616 12.4331 12.1814 13.9769C11.5388 14.5043 10.8106 15.1023 10.0548 15.739C9.85529 15.9072 9.59894 16 9.33333 16C9.06759 16 8.81138 15.9072 8.61171 15.7388C7.85763 15.1035 7.13059 14.5065 6.48916 13.9799L6.48588 13.9772C4.60529 12.4332 2.98132 11.0998 1.8514 9.7863C0.588318 8.31791 0 6.92567 0 5.40473C0 3.92701 0.52594 2.56372 1.48083 1.56581C2.44712 0.556101 3.77301 0 5.21468 0C6.2922 0 7.27899 0.3282 8.14758 0.975406ZM15.5 3C16.1298 3.65816 16.5 4.61965 16.5 5.66425C16.5 6.67447 16.0262 7.66018 15.0242 8.82496C14.09 9.91104 12.7219 11.0394 11.0017 12.4518C10.4587 12.8975 9.84236 13.4036 9.20008 13.9432C8.56095 13.4063 7.94718 12.9023 7.40627 12.4582L7.40334 12.4557L7.39875 12.452C5.67836 11.0395 4.31021 9.9111 3.376 8.82513C2.37392 7.66015 2 6.6744 2 5.66425C2 4.61974 2.37018 3.65822 3 3C3.63542 2.33605 4.51158 2 5.49321 2C6.20309 2 6.8401 2.21115 7.41583 2.64011C7.71225 2.86104 8.15888 3.13788 8.40969 3.47201L9.33333 4.79692L10.257 3.47201C10.5082 3.13759 10.7054 2.86091 11.0017 2.64011C11.5775 2.2111 12.2901 2 13 2C13.9815 2 14.8646 2.33606 15.5 3Z" fill="#D9DDE8"/>
                       </svg>`

    let svg_add = `<svg width="19" height="16" viewBox="0 0 19 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path fill-rule="evenodd" clip-rule="evenodd" d="M8.14758 0.975406C8.23666 1.04179 8.32405 1.1112 8.40969 1.18357C8.74547 1.46734 9.05441 1.79669 9.33333 2.16828C9.61236 1.7967 9.92122 1.46736 10.257 1.1836C10.3427 1.11122 10.4301 1.0418 10.5192 0.975406C11.3878 0.3282 12.3746 0 13.4521 0C14.8937 0 16.2197 0.556101 17.186 1.56581C18.1409 2.56372 18.6667 3.92701 18.6667 5.40473C18.6667 6.92567 18.0785 8.31791 16.8154 9.78616C15.6855 11.0997 14.0616 12.4331 12.1814 13.9769C11.5388 14.5043 10.8106 15.1023 10.0548 15.739C9.85529 15.9072 9.59894 16 9.33333 16C9.06759 16 8.81138 15.9072 8.61171 15.7388C7.85763 15.1035 7.13059 14.5065 6.48916 13.9799L6.48588 13.9772C4.60529 12.4332 2.98132 11.0998 1.8514 9.7863C0.588318 8.31791 0 6.92567 0 5.40473C0 3.92701 0.52594 2.56372 1.48083 1.56581C2.44712 0.556101 3.77301 0 5.21468 0C6.2922 0 7.27899 0.3282 8.14758 0.975406Z" fill="#56B29D"/>
                    </svg>`
    let exp = `<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M10.5204 19.0693L18.3645 10.7942C20.5452 8.44211 20.5452 4.8069 18.3644 2.45481C17.33 1.34289 15.8804 0.710225 14.3617 0.70788C13.1783 0.70925 12.0366 1.09287 11.1001 1.78758C10.8337 1.98514 10.584 2.20786 10.3546 2.4541L10.0015 2.82723L9.64836 2.4541C9.41292 2.2007 9.15905 1.97465 8.89075 1.77611C6.81629 0.240967 3.87875 0.349815 1.91953 2.17023C1.82148 2.26136 1.72679 2.35601 1.63565 2.4541C-0.545218 4.80644 -0.545218 8.44186 1.63565 10.7942L9.48255 19.0693C9.75403 19.3559 10.2064 19.3681 10.493 19.0966C10.5024 19.0878 10.5115 19.0786 10.5204 19.0693ZM3.09541 9.42698L10.0013 16.7097L16.9047 9.42705C18.3671 7.84212 18.3651 5.39818 16.8987 3.81556C16.2425 3.11113 15.3238 2.71011 14.3612 2.70788C13.3965 2.70975 12.4756 3.11144 11.8179 3.81739L11.8126 3.82312L10.0015 5.73694L8.18942 3.82216L8.18318 3.81544C6.87928 2.41209 4.68462 2.3314 3.28117 3.63512M3.09541 9.42698C1.63282 7.84174 1.63487 5.39752 3.10154 3.81468C3.15884 3.75304 3.21894 3.69299 3.28117 3.63512" fill="#00978E"/>
        </svg>`

    let btn = document.querySelectorAll('.product-vertical-extra__button')
    let favoriteCounter = document.querySelectorAll('.favorite__count')
    btn.forEach(item=>{
        item.addEventListener('click',function(e){
            e.preventDefault()
            let el = this
            let product = this.dataset.id
            let xhr = new XMLHttpRequest();
            let post_data =  'id='+product+'&'+'YUPE_TOKEN='+yupeToken
            if(this.classList.contains('yupe-store-favorite-add')){
                xhr.open("POST", yupeStoreAddFavoriteUrl,true)
                xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
                xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
                xhr.onload = () => {
                    let res = JSON.parse(xhr.response)
                    el.classList.remove('yupe-store-favorite-add')
                    el.classList.add('yupe-store-favorite-remove')
                    el.innerHTML = svg_add
                    favoriteCounter.forEach(item=>{
                        item.innerHTML = res.count
                    })
                }
                xhr.send(post_data)
            }else{
                xhr.open("POST", yupeStoreRemoveFavoriteUrl,true)
                xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
                xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
                xhr.onload = () => {
                    let res = JSON.parse(xhr.response)
                    el.classList.remove('yupe-store-favorite-remove')
                    el.classList.add('yupe-store-favorite-add')
                    el.innerHTML = el.classList.contains('exp') ? exp : svg_remove
                    favoriteCounter.forEach(item=>{
                        item.innerHTML = res.count
                    })
                }
                xhr.send(post_data)
            }
        })
    })

    let rmButton = document.querySelectorAll('.favorite-delete')
    if(rmButton.length){
        for(let bt of rmButton){
            bt.addEventListener('click',(e)=>{
                e.preventDefault()
                let el = e.currentTarget
                let product = el.dataset.id
                let xhr = new XMLHttpRequest();
                let post_data =  'id='+product+'&'+'YUPE_TOKEN='+yupeToken
                xhr.open("POST", yupeStoreRemoveFavoriteUrl,true)
                xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8")
                xhr.setRequestHeader("x-requested-with","XMLHttpRequest")
                xhr.onload = () => {
                    let res = JSON.parse(xhr.response)
                    el.closest('.product-item-glide').remove()
                    favoriteCounter.forEach(item=>{
                        item.innerHTML = res.count
                        if(parseInt(item.innerHTML) === 0){
                        document.getElementById('favorite-title').textContent = 'Нет результатов'
                        }
                    })
                }
                xhr.send(post_data)
            })
        }
    }
}
export default Favorite