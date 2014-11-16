PhotoCritic.Views.Photos ||= {}

class PhotoCritic.Views.Photos.ShowView extends Backbone.View
  # template: JST["backbone/templates/photos/show"]
  template: HandlebarsTemplates["templates/photos/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
