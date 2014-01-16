BunnyRescue.Router = Backbone.Router.extend
	initialize: (options) ->
		this.$rootEl = options.$rootEl

	routes:
		"": "index"

	index: () ->
		console.log("index")