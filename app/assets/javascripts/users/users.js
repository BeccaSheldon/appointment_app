// use debugger to break code and see what's up
// debugger = bff for figuring out js issues

	$(document).ready(function() {
		$('input[name="appointment[time]"]').datepicker({
			showWeek: true,
			firstDay: 1,
			dateFormat: 'yy-mm-dd'
		});

		$('input[name="appointment[date]"]').timepicker({'timeFormat': 'g:ia'});
		$('input[name="appointment[date]"]').timepicker({ 'step': 15 });
	});