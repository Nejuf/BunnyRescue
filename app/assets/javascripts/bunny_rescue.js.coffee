window.BunnyRescue = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: () ->
		BunnyRescue.bunnies = new BunnyRescue.Collections.Bunnies()

		# TODO have app start without fetching all bunnies
		BunnyRescue.bunnies.fetch
			success: () ->
				new BunnyRescue.Router
					$rootEl: $('#main')
				Backbone.history.start()
			error: (collection, response, options) ->
				console.log("Error fetching bunnies.", collection, resp)

$(document).ready () ->
	BunnyRescue.initialize()
