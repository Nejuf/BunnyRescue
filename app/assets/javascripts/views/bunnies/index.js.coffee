BunnyRescue.Views.Index = Backbone.View.extend
	template: JST["bunnies/index"]

	initialize: (options) ->
		this.collection = options.collection

	render: () ->
		content = this.template
			bunnies: this.collection.models
		this.$el.html(content)
		return this