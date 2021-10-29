function currentTime() {
  var date = new Date(); /* creating object of Date class */
  var hour = date.getHours();
  var min = date.getMinutes();

  hour = updateTime(hour);
  min = updateTime(min);
  document.getElementById("clock").innerText = hour + " : " + min;
  var t = setTimeout(function(){ currentTime() }, 60000);
}

function updateTime(k) {
  if (k < 10) {
    return "0" + k;
  }
  else {
    return k;
  }
}

currentTime();
