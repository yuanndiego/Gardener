
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"

toDoItem = document.querySelector('.to-do-item')
weather = document.querySelector('.weather')
taskCompleteButton = document.querySelector('.task_complete_button')
taskCompleteButtons = document.querySelectorAll('.task_complete_button')

StoreApiInformation = () => {
    $.ajax({
            dataType: 'json',
            url: "http://api.openweathermap.org/data/2.5/weather?q=Coburg,aus&APPID=65d2c718348e35c15481b8dbf08c238d"
    }).done(function (res) {
            if (res.weather[0].main === "Clouds") {
                weather.classList.add('.clouds')
            }            
        })
}

var changeCompleteValue = (event) => {
   console.log('kaskhdsf')
   var toDoItem = event.target
    $.ajax({
        method: 'post',
        url: '/api/todo',
        data: { todo_id: event.target.getAttribute('value') }
    }).done(function(res) {
        toDoItem.closest('.to-do-item').classList.add('test')
        setTimeout(()=>{
            toDoItem.closest('.to-do-item').classList.add('zero_height')
        }, 800);

        // copy the dom element
        // delete from original locatin
        // add to new lcoation
        // Reverse animations

    })
}

var acc = document.getElementsByClassName("accordionOne");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    panelOne = this.nextElementSibling;
    if (panelOne.style.display === "block") {
      panelOne.style.display = "none";
    } else {
      panelOne.style.display = "block";
      panelTwo.style.display = "none"
    }
  });
}

var acc = document.getElementsByClassName("accordionTwo");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    panelTwo = this.nextElementSibling;
    if (panelTwo.style.display === "block") {
      panelTwo.style.display = "none";
    } else {
      panelTwo.style.display = "block";
      panelOne.style.display = "none"

    }
  });
}

taskCompleteButtons.forEach(taskCompleteButton => {
    taskCompleteButton.addEventListener('click', changeCompleteValue)
})
