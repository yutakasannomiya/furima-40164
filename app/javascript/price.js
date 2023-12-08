document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item_price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);

    const addTaxValue = Math.floor(inputValue / 10);
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - addTaxValue;
  });
});