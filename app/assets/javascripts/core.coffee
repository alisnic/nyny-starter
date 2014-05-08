window.App = new Backbone.Marionette.Application
  M: {}
  V: {}
  C: {}
  Routers: {}

App.addInitializer ->
  new klass() for k,v of App.Routers
  Backbone.history.start()
