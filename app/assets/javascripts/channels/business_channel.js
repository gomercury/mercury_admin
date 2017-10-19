(function() {
  App.cable.subscriptions.create('BusinessCreateChannel', {
		received: function(data) {
			if ($('#businesses-index').length) {
				$('#businesses-index table tbody').prepend(data.business);
			}
			return;
		}
	});

	App.cable.subscriptions.create('BusinessUpdateChannel', {
		received: function(data) {
			if ($('#business_' + data.id).length) {
				$('#business_' + data.id).replaceWith(data.business);
			}
			return;
		}
	});

	App.cable.subscriptions.create('BusinessDestroyChannel', {
		received: function(data) {
			if ($('#business_' + data.id).length) {
				$('#business_' + data.id).remove();
			}
			return;
		}
	});
}).call(this);
