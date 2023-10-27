window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");

    // 価格を整数として取得
    const price = parseInt(priceInput.value, 10);

    if (!isNaN(price)) {
      const tax = Math.ceil(Math.floor(price * 1.1 * 100) / 100); // 税額（誤差を防ぐ）
      const profit = price - tax; // 利益
      addTaxDom.innerHTML = tax;
      addProfitDom.innerHTML = profit;
    }
  });
});
