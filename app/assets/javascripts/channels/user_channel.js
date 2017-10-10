(function() {
  App.cable.subscriptions.create('UserCreateChannel', {
		received: function(data) {
			return $('#users-index table tbody').append(data.user);
		}
	});

	App.cable.subscriptions.create('UserUpdateChannel', {
		received: function(data) {
			return $('#user_' + data.id).replaceWith(data.user);
		}
	});

	App.cable.subscriptions.create('UserDestroyChannel', {
		received: function(data) {
			return $('#user_' + data.id).remove();
		}
	});
}).call(this);
