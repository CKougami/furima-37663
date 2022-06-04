window.addEventListener('load', function(){                       

  const priceInput = document.getElementById('item-price');     
  const addTax = document.getElementById('add-tax-price');      
  const profit = document.getElementById('profit');               


  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;             
    addTax.innerHTML = Math.floor(inputValue/10).toLocaleString();                
    profit.innerHTML = (inputValue - Math.floor(inputValue/10)).toLocaleString(); 
  });
});

// .toLocaleString()  金額をカンマで区切る