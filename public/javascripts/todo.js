
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

var changeCompleteValue = () => {
   console.log('kaskhdsf')
   var toDoItem = event.target
    $.ajax({
        method: 'post',
        url: '/api/todo',
        data: { todo_id: event.target.getAttribute('value') }
    }).done(function() {
        // toDoItem.closest('.to-do-item').classList.add('test')
    })
}

taskCompleteButtons.forEach(taskCompleteButton => {
    taskCompleteButton.addEventListener('click', changeCompleteValue)
})
