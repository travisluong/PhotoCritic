PhotoCritic.Views.Home ||= {}

class PhotoCritic.Views.Home.NavView extends Backbone.View
  template: HandlebarsTemplates["templates/home/nav"]

  lastIndexLinks:
    '/': '#home-link'
    '/photos': '#photos-link'
    '/new': '#new-link'

  events: ->
    "click a": "navClicked"

  navClicked: (e) ->
    $('#photo-critic-nav').find('li').removeClass('active')
    aElem = $(e.target)
    aElem.parent().addClass('active')

  render: ->
    @$el.html(@template())

    # after the template has been rendered and attached to element:
    # get the url last index string and find the associated nav id
    # set the li to active
    href = window.location.toString()
    lastIndex = href.substr(href.lastIndexOf('/'))
    id = @lastIndexLinks[lastIndex]
    selector = "#photo-critic-nav #{id}"
    @$el.find(selector).parent().addClass('active') 

    return this