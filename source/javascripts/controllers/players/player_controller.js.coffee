PingBoard.PlayerController = Ember.ObjectController.extend
  needs: "matches"

  isSelected: ( ->
    @get("model") is @get("parentController.selectedPlayer")
  ).property("parentController.selectedPlayer")

  victories: (->
    victoriousMatches = @get("controllers.matches.model").filter (match) =>
      match.get("winner") is @get("model")
    victoriousMatches.get("length")
  ).property("controllers.matches.@each")