```html
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<title>Google Spreadsheet</title>
<style>
* {
  margin: 5px;
  padding: 0;
}
body {
  background-color: #ccc;
}
input[type="button"], input[type="submit"] {
  background-color: #eee;
  padding: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function save() {
    $.ajax({
        url: $("form").attr("action"),
        data: $("form").serialize(),
        type: "POST",
        dataType: "json",
        success: function (e) {
            if (e.response) {
                alert("Salvo com Sucesso!");
            } else {
                alert("Não foi possível salvar!");
            }
        },
        error: function () {
            alert("ERRO!");
        }
    });
}
</script>
</head>
<body>
<fieldset>
  <form style="text-align: center;" action="https://script.google.com/macros/s/AKfycbzVUx3eelzsucQckYwEoRWUGAxkOwaV5u4BysOMFPMQPAiHBMFhzU29aUsT8GUc1cfY/exec" method="POST">
    <input type="text" name="idlead" value="1">
    <input type="text" name="gestor.nome" value="Gestor de teste">
    <input type="text" name="imobiliaria.nome" value="Imobiliária Bem Viver"><br>
    <input type="text" name="corretor.nome" value="Corretor de teste">
    <input type="text" name="situacao.nome" value="Em Atendimento">
    <input type="text" name="nome" value="Lead do Teste"><br>
    <input type="text" name="email" value="lead.teste@example.com">
    <input type="text" name="telefone" value="48999476359">
    <input type="text" name="score" value="27"><br>
    <input type="text" name="data_cad" value="2020-02-04 16:49:57">
    <input type="text" name="midia_principal" value="null">
    <input type="text" name="origem" value="Painel Gestor"><br>
    <input type="text" name="empreendimento[0].nome" value="1 - Empreendimento de teste">
    <input type="text" name="interacao[0].descricao" value="Nova interação">
    <input type="text" name="interacao[0].data_cad" value="2020-02-04 17:58:49"><br>
    <input type="text" name="tarefa[0].nome" value="Nova tarefa">
    <input type="text" name="tarefa[0].descricao" value="Essa é uma nova tarefa de teste">
    <input type="text" name="tarefa[0].data_cad" value="2020-02-04 17:58:50"><br>
    <input type="text" name="tarefa[0].data" value="2020-02-04 20:00:00">
    <input type="text" name="tarefa[0].data_conclusao" value="null">
    <input type="text" name="tarefa[0].data_cancelamento" value="null"><br>
    <input type="submit" value="Salvar">
    <input type="button" value="Salvar (Ajax)" onclick="save()">
  </form>
</fieldset>

<script>
// -----------------------------------------------------------------------------
// Add the script in the Google Script console.
// -----------------------------------------------------------------------------
/**
 * Script to insert HTML form data into Google Spreadsheet.
 * Author: Leandro Sciola - leandrosciola@gmail.com
 * Date: 28/02/2022
 */
function insert(data) {
    var lastRow = SpreadsheetApp.getActiveSheet().getLastRow();
    SpreadsheetApp.getActiveSheet().getRange(lastRow + 1, 1, data.length, data[0].length).setValues(data);
}
function printJSON(data) {
    return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);
}
function printHTML(data) {
    return HtmlService.createHtmlOutput(data);
}
function check(data) {
    data[0].forEach(function (item, index) {
        if (item === "null") {
            data[0][index] = "";
        }
    });
}
function doPost(e) {
    var data = [];
    var json = e.parameter;
    /* -------------------------------------
      Add the fields in the array in order
    ------------------------------------- */
    data.push([
      json["idlead"],
      json["gestor.nome"],
      json["imobiliaria.nome"],
      json["corretor.nome"],
      json["situacao.nome"],
      json["nome"],
      json["email"],
      json["telefone"],
      json["score"],
      json["data_cad"],
      json["midia_principal"],
      json["origem"],
      json["empreendimento[0].nome"],
      json["interacao[0].descricao"],
      json["interacao[0].data_cad"],
      json["tarefa[0].nome"],
      json["tarefa[0].descricao"],
      json["tarefa[0].data_cad"],
      json["tarefa[0].data"],
      json["tarefa[0].data_conclusao"],
      json["tarefa[0].data_cancelamento"]
    ]);
    /* -------------------------------------
      Check the data
    ------------------------------------- */
    check(data)
    /* -------------------------------------
      Add data to worksheet
    ------------------------------------- */
    insert(data);
    /* -------------------------------------
      Returns response in JSON format
    ------------------------------------- */
    return printJSON({response: "success"});
}
</script>

</body>
</html>
```
