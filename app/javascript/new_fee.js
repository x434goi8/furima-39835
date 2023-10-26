document.addEventListener('DOMContentLoaded', function() {
  const salePriceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  salePriceInput.addEventListener('input', function() {
    const inputValue = salePriceInput.value;
    if (!inputValue) {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    } else {
      const salePrice = parseFloat(inputValue);
      if (isNaN(salePrice)) {
        addTaxPrice.textContent = 'NaN';
        profit.textContent = 'NaN';
      } else {
        const tax = salePrice * 0.10;
        const profitAmount = salePrice - tax;
        addTaxPrice.textContent = Math.floor(tax).toString();
        profit.textContent = Math.floor(profitAmount).toString();
      }
    }
  });
});