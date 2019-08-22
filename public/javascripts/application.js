var plantUiCards = document.querySelectorAll(".plant-ui-card-container")


const selectPlant = function(event) {
    if(event.currentTarget.firstElementChild.name === "") {
        event.target.closest('.plant-ui-card-container').querySelector('input').name = "plantSelected[]"
        event.target.classList.add("plant_selected_opacity")
        event.target.closest('.plant-ui-card-container').querySelector('.add_plants_icons').src = '/icon_assets/baseline-check_circle_outline-24px.svg'
    } else {
        console.log("else statemebnt");
        event.target.closest('.plant-ui-card-container').querySelector('input').name = ""
        event.target.classList.remove("plant_selected_opacity")
        event.target.closest('.plant-ui-card-container').querySelector('.add_plants_icons').src = '/icon_assets/baseline-add_circle_outline-24px.svg'
    }
} 

plantUiCards.forEach(plantUiCard => {plantUiCard.addEventListener('click', selectPlant)})

