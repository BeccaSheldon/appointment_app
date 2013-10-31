// Possible backbone calendar template

(function () {
	window.AppointmentView = Backbone.View.extend({
		el: $('#calendar'),
		template: _.template($('#calendar-template').html()),
		setDate: function(date) {
			this.date = date;
			this.render();
		},
		render: function() {
			$('span.year-and-month', 'h1').html(' (' + this.date + ')');

			$(this.el).html(this.template({
				date: this.date
			}));

			this.addDates();
			this.hideEmptyWeeks();

			return this;
		},
		addDates: function() {
			var firstOfTheMonth = Helpers.firstOfTheMonth(this.date),
				month = firstOfTheMonth.getMonth(),
				firstSunday = new Date(firstOfTheMonth.getTime() -
												firstOfTheMonth.getDay()*24*60*60*1000);
			var date = firstSunday;
			_([0,1,2,3,4,5,6]).each(function(week) {
				var week_el = $('.week' + week, this.el),
					day_elements = week_el.find('td');
					
				_([0,1,2,3,4,5,6]).each(function(day) {
					var day_element = day_elements[day],
							other_month = (date.getMonth() != month),
							html = '<span class="day-of-month">' + date.getDate() + '</span>';

					$(day_element).
						html(html).
						attr('id', Helpers.to_iso8601(date)).
						addClass(other_month ? 'other-month' : '');

					date = Helpers.dayAfter(date);
			});
		});
	},
	hideEmptyWeeks: function() {
		var week5_other_month = _($('td', '.week5')).all(function(el) {
			return $(el).hasClass('other-month');
		});
		if (week5_other_month) $('.week5').hide();
	}
});