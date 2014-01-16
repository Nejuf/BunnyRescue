window.BunnyRescue = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: () ->
		new BunnyRescue.Router
			$rootEl: $('#main')
		Backbone.history.start()

$(document).ready () ->
	BunnyRescue.initialize()
