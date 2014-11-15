class PhotoCritic.Routers.PhotosRouter extends Backbone.Router
  initialize: (options) ->
    @photos = new PhotoCritic.Collections.PhotosCollection()
    @photos.reset options.photos

  routes:
    "new"      : "newPhoto"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPhoto: ->
    @view = new PhotoCritic.Views.Photos.NewView(collection: @photos)
    $("#photos").html(@view.render().el)

  index: ->
    @view = new PhotoCritic.Views.Photos.IndexView(photos: @photos)
    $("#photos").html(@view.render().el)

  show: (id) ->
    photo = @photos.get(id)

    @view = new PhotoCritic.Views.Photos.ShowView(model: photo)
    $("#photos").html(@view.render().el)

  edit: (id) ->
    photo = @photos.get(id)

    @view = new PhotoCritic.Views.Photos.EditView(model: photo)
    $("#photos").html(@view.render().el)
