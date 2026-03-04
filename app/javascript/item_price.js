const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1));
  })
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);
