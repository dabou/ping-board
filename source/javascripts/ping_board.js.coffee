#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./templates
#= require_tree ./routes
#= require_self

$(->
  $("#players-form").modal("show")
)