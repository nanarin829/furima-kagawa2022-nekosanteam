function calc (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const calcPrice = parseInt(itemPrice.value * 0.1, 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = calcPrice;
    const calcPriceProfit = parseInt(itemPrice.value * 0.9, 10);
    const profit = document.getElementById("profit");
    profit.innerHTML = calcPriceProfit;
  });
};
window.addEventListener('load', calc);