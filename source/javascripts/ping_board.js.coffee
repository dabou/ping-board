#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./templates
#= require_tree ./routes
#= require_self

$(->
  modal = $("#players-form").modal()
  modal.on "shown", ->
    $(@).find("input[type=text]").focus()

  modal.modal("show")
)