PhotoCritic.Views.Home ||= {}

class PhotoCritic.Views.Home.Index extends Backbone.View
  template: HandlebarsTemplates["templates/home/index"]

  render: ->
    @$el.html(@template())
    return this