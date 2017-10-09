//= require cable
//= require_self
//= require_tree .

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

  App.businesses = App.cable.subscriptions.create('BusinessesCreateChannel', {
		received: function(data) {
			console.log('create business');
			return $('#businesses-index table tbody').append(data.business);
		}
	});

	App.businesses = App.cable.subscriptions.create('BusinessesUpdateChannel', {
		received: function(data) {
			console.log('update business');
			return $('#business_' + data.id).replaceWith(data.business);
		}
	});

	App.businesses = App.cable.subscriptions.create('BusinessesDestroyChannel', {
		received: function(data) {
			console.log('destroy business');
			return $('#business_' + data.id).remove();
		}
	});
}).call(this);
