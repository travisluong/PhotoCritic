PhotoCritic.Views.Home ||= {}

class PhotoCritic.Views.Home.NavView extends Backbone.View
  template: HandlebarsTemplates["templates/home/nav"]

  events: ->
    "click a": "navClicked"
    "click #my-photos-link": "myPhotosLink"

  myPhotosLink: ->
    alert('test')
    PhotoCritic.Routers.PhotoRouter.navigate('photos', {trigger: true})

  navClicked: (e) ->
    $('#photo-critic-nav').find('li').removeClass('active')
    aElem = $(e.target)
    aElem.parent().addClass('active')

  render: ->
    @$el.html(@template())
    return this