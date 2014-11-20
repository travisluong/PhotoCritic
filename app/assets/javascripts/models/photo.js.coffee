class PhotoCritic.Models.Photo extends Backbone.Model
  paramRoot: 'photo'

  defaults:
    title: null

  validate: (attributes, options) ->
    return "this model is invalid"

class PhotoCritic.Collections.PhotosCollection extends Backbone.Collection
  model: PhotoCritic.Models.Photo
  url: '/photos'
