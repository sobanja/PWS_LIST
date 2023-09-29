function load() {
  inizializzaBehaviors();
  CheckResult();
}

// формирует URL на основе значений полей формы и перенаправляет на этот URL
function listaCDA() {
  // Проверяем, что значения полей 'MNW2G-IO-MNCAST' и 'MNW2G-IO-MNSR' не пустые
    if(document.getElementById('MNW2G-IO-MNCAST').value && document.getElementById('MNW2G-IO-MNSR').value != '') {
      // Создаем строку hLocation для формирования URL
      var hLocation = "/process.aspx?PAGE=MN/MNW2G/PDS/MNFW2G";
        // Добавляем параметры к URL
      hLocation += "&MNW2G-FUNZ=CT";
      hLocation += "&MNW2G-I-CERCA=SC";
      hLocation += "&MNW2G-IO-MNSR=" + document.getElementById('MNW2G-IO-MNSR').value;
      hLocation += "&MNW2G-IO-MNCAST=" + document.getElementById('MNW2G-IO-MNCAST').value ;
      // Проверяем значение поля 'mezziPagamento' и добавляем параметр, если значение не "T"
      if(document.getElementById('mezziPagamento').cod === "T") document.getElementById('mezziPagamento').cod = "";
      hLocation += "&MNW2G-I-MNCAPY=" + document.getElementById('mezziPagamento').cod;
      // Перенаправляем пользователя по сформированному URL
      document.location = hLocation; 
      // Если одно из полей пустое, выводим сообщение об ошибке
    } else {
      alert("Type value");
    }
}




