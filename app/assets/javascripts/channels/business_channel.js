(function() {
  App.cable.subscriptions.create('BusinessCreateChannel', {
		received: function(data) {
			return $('#businesses-index table tbody').append(data.business);
		}
	});

	App.cable.subscriptions.create('BusinessUpdateChannel', {
		received: function(data) {
			return $('#business_' + data.id).replaceWith(data.business);
		}
	});

	App.cable.subscriptions.create('BusinessDestroyChannel', {
		received: function(data) {
			return $('#business_' + data.id).remove();
		}
	});
}).call(this);
