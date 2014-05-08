Backbone.Marionette.Renderer.render = (template, data) ->
  template_path = if typeof template is "function"
    template()
  else
    template

  if (!JST[template_path])
    throw "Template #{template} not found!"

  return JST[template_path](data)
