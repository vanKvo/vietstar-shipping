let carts = document.querySelectorAll('.cart.button')

let products = [
    {
        name: 'Eagle Brand Medicated Oil',
        tag: 'medicatedoil',
        inCart:0
    },
    {
        name: 'Longetivity Essential Oil',
        tag: 'medicatedoil',
        inCart:0
    },
    {
        name: 'Emergen-C Vitamin C',
        tag: 'vitaminc',
        inCart:0
    },
    {
        name: 'Vaseline',
        tag: 'vaselinehealingjelly',
        inCart:0
    },
    {
        name: 'Tylenol',
        tag: 'tylenolpainmedication',
        inCart:0
    },
    {
        name: 'One 1 a day female multivatmin',
        tag: 'multivitamin',
        inCart:0
    },
    {
        name: 'Sun-maid',
        tag: 'raisins',
        inCart:0
    }
]


for (let i =0; i < carts.length; i++ ){
    carts[i].addEventListener('click', () =>{
        cartnumbers();
    })
}
function cartnumbers(){
    let productNumbers = localStorage.getItem('cartnumbers');

    if( productNumbers) {
        localStorage.setItem('cartnumbers', productNumbers + 1);
        document.querySelector('.cart span').textContent = productNumbers + 1;
    } else {
        localStorage.setItem('cartnumber', 1)
        document.querySelector('.cart span').textContent = 1;
    }

    productNumbers = parseInt(productNumbers);
    localStorage.setItem('cartnumbers', 1)
}