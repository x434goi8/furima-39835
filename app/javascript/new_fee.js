window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");

    // 価格を整数として取得
    const price = parseInt(priceInput.value, 10);

    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1); // 税額（小数点以下を切り捨て）
      const profit = price - tax; // 利益
      if (tax === 0) {
        addTaxDom.innerHTML = "";
      } else {
        addTaxDom.innerHTML = tax;
      }
      addProfitDom.innerHTML = profit;
    }
  });
});
