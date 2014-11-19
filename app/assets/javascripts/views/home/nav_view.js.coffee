PhotoCritic.Views.Home ||= {}

class PhotoCritic.Views.Home.NavView extends Backbone.View
  template: HandlebarsTemplates["templates/home/nav"]

  events: ->
    "click a": "navClicked"

  navClicked: (e) ->
    $('#photo-critic-nav').find('li').removeClass('active')
    aElem = $(e.target)
    aElem.parent().addClass('active')

  render: ->
    @$el.html(@template())
    return this