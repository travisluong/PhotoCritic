PhotoCritic.Views.Photos ||= {}

class PhotoCritic.Views.Photos.IndexView extends Backbone.View
  template: HandlebarsTemplates["templates/photos/index"]

  initialize: () ->
    @options.photos.bind('reset', @addAll)
    Backbone.PubSub.off('loadMore')
    Backbone.PubSub.on('loadMore', @loadMore)

  addAll: () =>
    @options.photos.each(@addOne)

  addOne: (photo) =>
    view = new PhotoCritic.Views.Photos.PhotoView({model : photo})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(photos: @options.photos.toJSON() ))
    @addAll()

    return this

  loadMore: =>
    $('#photos-table').after('<div id="loading" class="well">Loading...</div>')
    @options.photos.page = @options.photos.page + 1
    @options.photos.fetch
      success: (collection, response, options) ->
        $('#loading').remove()
      error: (collection, response, options) ->
        $('#loading').empty().addClass('alert alert-danger').text('Error loading.')
