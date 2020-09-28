function tax() {
  const input = document.getElementById("item-price");
  input.onkeyup = itemPrice;
  function itemPrice(e) {
    const itemPrice = document.getElementById("item-price").value;
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const price = Math.floor(itemPrice * 0.1);
    taxPrice.innerHTML = price;
    profit.innerHTML = itemPrice - price;
  };
}
window.addEventListener("load", tax)