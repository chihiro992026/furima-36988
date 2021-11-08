window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = inputValue * 0.1

  const addprofit = document.getElementById("profit");
  addprofit.innerHTML = inputValue - (inputValue * 0.1)

  addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );

  addprofit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))

  

  
})
  


});

