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

  defeats: (->
    defeatedMatches = @get("controllers.matches.model").filter (match) =>
      match.get("looser") is @get("model")
    defeatedMatches.get("length")
  ).property("controllers.matches.@each")