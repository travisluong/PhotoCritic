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
    $(e.target).find('input[type=submit]').addClass('disabled').val('Uploading...')
    input = $('form input[type=file]')
    titleElem = $('form #title')
    title = titleElem.val()
    isValid = true
    $('.text-danger').remove()
    $('.form-group').removeClass('has-error')
    if _.isEmpty(title)
      isValid = false
      titleElem.closest('.form-group').addClass('has-error')
      titleElem.after("<p class='text-danger'>Missing Title</p>")
    if input[0].files[0] == undefined

      input.closest('.form-group').addClass('has-error')
      input.after("<p class='text-danger'>Missing Image</p>")
      isValid = false
    if !isValid
      return

    formData = new FormData()
    formData.append('photo[image]', input[0].files[0])
    formData.append('photo[title]', title)
    @model.data = formData
    @model.unset("errors")

    @model.validate()

    $.ajax({
      url: '/api/photos',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      type: 'POST',
      success: (data) =>
        Backbone.history.navigate("/photos/#{data.photo.id}", {trigger: true})
      error: (model, xhr, options) ->
        alert('Error')
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
