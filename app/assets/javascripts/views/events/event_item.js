Whiggly.Views.EventItem = Backbone.View.extend({
	className: "event-item",
	template: JST['events/item'],
	
	// render: function() {
	// 	var content = this.template({ event: this.model });
	// 	debugger
	// 	this.$el.html(content);
	// 	return this;
	// }
});