PhotoCritic.Views.Home ||= {}

class PhotoCritic.Views.Home.WindowView extends Backbone.View
  el: $(window)
  initialize: ->
    @isLoading = false
  events:
    "scroll": "loadMore"
  loadMore: ->
    body = $('body')
    if body.height() - @$el.height() == @$el.scrollTop()
      Backbone.PubSub.trigger('loadMore')