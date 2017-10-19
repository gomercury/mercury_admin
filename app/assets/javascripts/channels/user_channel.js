(function() {
  App.cable.subscriptions.create('UserCreateChannel', {
		received: function(data) {
			if ($('#users-index').length) {
				$('#users-index table tbody').prepend(data.user);
			}
			return;
		}
	});

	App.cable.subscriptions.create('UserUpdateChannel', {
		received: function(data) {
			if ($('#user_' + data.id).length) {
				$('#user_' + data.id).replaceWith(data.user);
			}
			return;
		}
	});

	App.cable.subscriptions.create('UserDestroyChannel', {
		received: function(data) {
			if ($('#user_' + data.id).length) {
				$('#user_' + data.id).remove();
			}
			return;
		}
	});
}).call(this);
