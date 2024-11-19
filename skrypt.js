
const tekst2 = ["Promocja!","Nowy Repertuar!","Sprawdź oferte"]
const tekst = document.querySelector('#tekst2');
let position = 0;
let i = 0
tekst.innerHTML = tekst2[i]

function test(){
    i++
    if(i>2){
        i = 0
}
tekst.innerHTML = tekst2[i]

}
setInterval(test,2000);

function animation(){
position += 5;


if(position > screen.width){
    position = -50;
}
tekst.style.left = position + 'px';
requestAnimationFrame(animation);

}
animation();