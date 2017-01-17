alertButtonHandler = (e) ->
  console.log("button clicked :(")
  alert("You clicked the button.")


redButtonClicker = (el) ->
  document.querySelector(el).addEventListener "click", alertButtonHandler

module.exports =
  redButtonClicker: redButtonClicker
