function calc () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const countTax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = countTax.toLocaleString();
    const getProfit = inputValue - countTax;
    const countProfit = document.getElementById("profit");
    countProfit.innerHTML = getProfit.toLocaleString();
  })
};

window.addEventListener('load', calc);