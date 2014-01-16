BunnyRescue.Router = Backbone.Router.extend
	initialize: (options) ->
		this.$rootEl = options.$rootEl

	routes:
		"": "index"

	index: () ->
		view = new BunnyRescue.Views.Home
		this._swapView(view)
		
	_swapView: (view) ->
		this._currentView && this._currentView.remove()
		this._currentView = view
		this.$rootEl.html(view.render().$el)