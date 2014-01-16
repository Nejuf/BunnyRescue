BunnyRescue.Views.Home = Backbone.View.extend
	template: JST["main/home"]

	initialize: () ->
		console.log('Home view initialize')

	render: () ->
		content = this.template()
		this.$el.html(content)
		return this