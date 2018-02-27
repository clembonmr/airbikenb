
function alertbtn(){
 let arr = JSON.parse(bookingList)
 let condition = false
 let btn = document.getElementById("booking-alert");
arr.forEach(function(element){
if (element.status == 0){
    condition = true
  }
})
  if (condition == true){
    btn.style.display = "block"
    }

}

export { alertbtn }






