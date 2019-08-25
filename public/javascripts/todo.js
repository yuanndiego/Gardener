
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"

var taskCompleteButtons = document.querySelectorAll('.task_complete_button')
var acc1 = document.querySelector(".accordionOne");
var acc2 = document.querySelector(".accordionTwo");
var panelOne = document.querySelector('.panelOne');
var panelTwo = document.querySelector('.panelTwo');

var completeTodos = null;
var incompleteTodos = null;

var collectCompleteTodos = () => {
  $.ajax({
    dataType: 'json',
    url: "/api/todos/complete"
  }).done((res)=>{
    // Use data to populate dom
    res.map((todo)=>{
      completeTodos.push({});
    })
    // consider dom state & match
  })
}

var StoreApiInformation = () => {
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
  var toDoItem = event.target
  $.ajax({
    method: 'post',
    url: '/api/todos',
    data: { todo_id: event.target.getAttribute('value') }
  }).done(function(res) {
      toDoItem.closest('.to-do-item').classList.add('zero-width')
      setTimeout(()=>{
        toDoItem.closest('.to-do-item').classList.add('collapse_height')
        setTimeout(()=>{
          toDoItem.closest('.to-do-item').classList.add('zero_height')
        },250);
      }, 500);
  })
}

acc1.addEventListener("click", function() {
  this.classList.toggle("closed");
  if (panelOne.classList.contains('closed')){
    panelOne.classList.remove('closed');
    panelTwo.classList.add('closed');
  } else {
    panelOne.classList.add('closed');
  }
});

acc2.addEventListener("click", function() {
  this.classList.toggle("closed");
  if (panelTwo.classList.contains('closed')){
    panelTwo.classList.remove('closed');
    panelOne.classList.add('closed');
  } else {
    panelTwo.classList.add('closed');
  }
});

taskCompleteButtons.forEach(taskCompleteButton => {
    taskCompleteButton.addEventListener('click', changeCompleteValue)
})
