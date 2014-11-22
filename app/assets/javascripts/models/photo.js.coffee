class PhotoCritic.Models.Photo extends Backbone.Model
  paramRoot: 'photo'

  defaults:
    title: null

  validate: (attributes, options) ->
    return "this model is invalid"

  parse: (response) ->
    # fix for this problem: parse gets run twice, once for the collection, and once for the model
    # this breaks the index view, so we need to check if the response has photo key before parsing
    # so it works for both index and show view
    if _.has(response, 'photo')
      return response.photo
    else
      return response

class PhotoCritic.Collections.PhotosCollection extends Backbone.Collection
  model: PhotoCritic.Models.Photo
  
  url: -> 
    '/api/photos' + '?page=' + @page
  
  page: 1

  parse: (response) ->
    return response.photos