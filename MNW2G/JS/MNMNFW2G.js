// для хранения объекта DynamicTable.
var userTable; 
//  для хранения объекта jwExport_new.
var btnExportCSV1; 

function load() {
  CheckResult();
  // Устанавливаем диапазон страниц с помощью функции setRange, используя значения getCurrentPage() и getTotPages().
  setRange(getCurrentPage(), getTotPages()); 
  // Созд объект DynamicTable и привязываем его к таблице с идентификатором "scollableTable".
  userTable = new DynamicTable(document.getElementById("scollableTable"));
  // Созд объект jwExport_new для экспорта данных в формате CSV с указанными параметрами(для Status CDA) .
  btnExportCSV1 = new jwExport_new({
    id: "jwExport_exportDatiCSV1",
    type: "csv",
    title: "ListaCDA",
    label: "Esporta CSV",
    onclick: function () {},
  });
}
