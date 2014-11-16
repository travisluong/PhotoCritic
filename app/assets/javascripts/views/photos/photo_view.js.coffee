PhotoCritic.Views.Photos ||= {}

class PhotoCritic.Views.Photos.PhotoView extends Backbone.View
  template: HandlebarsTemplates["templates/photos/photo"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
