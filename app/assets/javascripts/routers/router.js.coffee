BunnyRescue.Router = Backbone.Router.extend
	initialize: (options) ->
		this.$rootEl = options.$rootEl

	routes:
		"": "home"
		"rabbits": "bunnies_index"
		"bunnies": "bunnies_index"

	home: () ->
		view = new BunnyRescue.Views.Home
		this._swapView(view)

	_swapView: (view) ->
		this._currentView && this._currentView.remove()
		this._currentView = view
		this.$rootEl.html(view.render().$el)

	bunnies_index: () ->
		view = new BunnyRescue.Views.Index
			collection: BunnyRescue.bunnies
		this._swapView(view)