class PhotoCritic.Routers.PhotosRouter extends Backbone.Router
  initialize: (options) ->
    @photos = new PhotoCritic.Collections.PhotosCollection()
    @navView = new PhotoCritic.Views.Home.NavView()
    @windowView = new PhotoCritic.Views.Home.WindowView()
    $("#photo-critic-nav").html(@navView.render().el)

  routes:
    "home"     : "home"
    "photos/new"      : "newPhoto"
    "photos/index"    : "indexPhoto"
    "photos/:id/edit" : "editPhoto"
    "photos/:id"      : "showPhoto"
    "photos"        : "indexPhoto"
    ".*"                : "home"

  home: ->
    Backbone.PubSub.off('loadMore')
    @view = new PhotoCritic.Views.Home.Index()
    $("#photo-critic-app").html(@view.render().el)

  newPhoto: ->
    Backbone.PubSub.off('loadMore')
    @view = new PhotoCritic.Views.Photos.NewView(collection: @photos)
    $("#photo-critic-app").html(@view.render().el)

  indexPhoto: ->
    Backbone.PubSub.off('loadMore')
    @photos.reset()
    @photos.page = 1
    @photos.fetch()
    @view = new PhotoCritic.Views.Photos.IndexView(photos: @photos)
    $("#photo-critic-app").html(@view.render().el)

  showPhoto: (id) ->
    Backbone.PubSub.off('loadMore')
    photo = new PhotoCritic.Models.Photo()
    photo.id = id
    photo.url = ->
      '/api/photos/' + id
    photo.fetch({success: (model, response, options) ->
      # photo = @photos.get(id)
      @view = new PhotoCritic.Views.Photos.ShowView(model: photo)
      $("#photo-critic-app").html(@view.render().el)
    })

  editPhoto: (id) ->
    Backbone.PubSub.off('loadMore')
    photo = new PhotoCritic.Models.Photo()
    photo.id = id
    photo.url = ->
      '/api/photos/' + id
    photo.fetch({success: (model, response, options) ->
      # photo = @photos.get(id)
      @view = new PhotoCritic.Views.Photos.EditView(model: photo)
      $("#photo-critic-app").html(@view.render().el)
    })

  # setActiveOnNav: =>
  #   href = window.location.toString()
  #   id = href.substr(href.lastIndexOf('/'))
  #   selector = "#photo-critic-nav a[href='#{id}'']"
  #   @navView.$el.find(selector).parent().addClass('active')
