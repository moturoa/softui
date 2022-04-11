function setClickId(id, inputId){ 
 Shiny.setInputValue(inputId,  {"id": id, "nonce": Math.random()});
} 
