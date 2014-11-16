PhotoCritic.Views.Photos ||= {}

class PhotoCritic.Views.Photos.EditView extends Backbone.View
  template: HandlebarsTemplates["templates/photos/edit"]

  events:
    "submit #edit-photo": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (photo) =>
        @model = photo
        window.location.hash = "/photos/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
