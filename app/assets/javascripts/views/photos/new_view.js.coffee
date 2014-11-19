PhotoCritic.Views.Photos ||= {}

class PhotoCritic.Views.Photos.NewView extends Backbone.View
  template: HandlebarsTemplates["templates/photos/new"]

  events:
    "submit #new-photo": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    input = $('form input[type=file]')
    title = $('form #title').val()
    formData = new FormData()
    formData.append('photo[image]', input[0].files[0])
    formData.append('photo[title]', title)
    @model.data = formData
    @model.unset("errors")

    $.ajax({
      url: '/photos',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      type: 'POST',
      success: (data) =>
        photo = JSON.parse(data)
        model = new @collection.model()
        model.set(photo)
        # must add photo to collection so we can "get" the photo in the router
        @collection.add(model)
        window.location.hash = "/photos/#{photo.id}"
    })    

    # @collection.create(@model.toJSON(),
    #   success: (photo) =>
    #     debugger
    #     @model = photo
    #     window.location.hash = "/photos/#{@model.id}"

    #   error: (photo, jqXHR) =>
    #     @model.set({errors: $.parseJSON(jqXHR.responseText)})
    # )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
