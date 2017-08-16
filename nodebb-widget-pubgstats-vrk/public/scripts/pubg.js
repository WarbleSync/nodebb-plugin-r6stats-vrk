
function selectGame(){
  var select = document.getElementById('pubgselect')
  var mode = select.options[select.selectedIndex].value,
  solo = document.getElementById('solo'),
  duo = document.getElementById('duo'),
  squad = document.getElementById('squad')

  if(mode == 'solo'){
    solo.style.display = 'block'
    duo.style.display = 'none'
    squad.style.display = 'none'
  }
  if(mode == 'duo'){
    solo.style.display = 'none'
    duo.style.display = 'block'
    squad.style.display = 'none'
  }
  if(mode == 'squad'){
    solo.style.display = 'none'
    duo.style.display = 'none'
    squad.style.display = 'block'
  }
}

function showData(target){
  var div = target.nextElementSibling
  if(div.style.display === 'none'){
    div.style.display = 'block'
  } else {
    div.style.display = 'none'
  }
}
