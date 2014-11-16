class PhotoCritic.Routers.PhotosRouter extends Backbone.Router
  initialize: (options) ->
    @photos = new PhotoCritic.Collections.PhotosCollection()
    # @photos.reset options.photos

  routes:
    "home"     : "home"
    "photos/new"      : "newPhoto"
    "photos/index"    : "indexPhoto"
    "photos/:id/edit" : "editPhoto"
    "photos/:id"      : "showPhoto"
    "photos"        : "indexPhoto"
    ".*"                : "home"

  home: ->
    @view = new PhotoCritic.Views.Home.Index()
    $("#container").html(@view.render().el)

  newPhoto: ->
    @view = new PhotoCritic.Views.Photos.NewView(collection: @photos)
    $("#container").html(@view.render().el)

  indexPhoto: ->
    @photos.fetch()
    @view = new PhotoCritic.Views.Photos.IndexView(photos: @photos)
    $("#container").html(@view.render().el)

  showPhoto: (id) ->
    photo = @photos.get(id)

    @view = new PhotoCritic.Views.Photos.ShowView(model: photo)
    $("#container").html(@view.render().el)

  editPhoto: (id) ->
    photo = @photos.get(id)

    @view = new PhotoCritic.Views.Photos.EditView(model: photo)
    $("#container").html(@view.render().el)
