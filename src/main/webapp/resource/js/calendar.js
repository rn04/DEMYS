var CalendarList = [];

function CalendarInfo() {
	this.id = null;
	this.name = null;
	this.checked = true;
	this.color = null;
	this.bgColor = null;
	this.borderColor = null;
	this.dragBgColor = null;
}

function findCalendar(id) {
	var found;

	CalendarList.forEach(function(calendar) {
		if (calendar.id === id) {
			found = calendar;
		}
	});

	return found || CalendarList[0];
}

function addCalendar(calendar) {
	CalendarList.push(calendar);
}

// 카테고리 설정
(function() {
	var calendar;
	var id = 0;

	calendar = new CalendarInfo();
	id += 1;
	calendar.id = String(id);
	calendar.name = 'Post';
	calendar.color = '#624AC0';
	calendar.bgColor = '#2400ff';
	calendar.dragBgColor = '#2400ff';
	calendar.borderColor = '#2400ff';
	addCalendar(calendar);

	calendar = new CalendarInfo();
	id += 1;
	calendar.id = String(id);
	calendar.name = 'Events';
	calendar.color = '#FF8C1A';
	calendar.bgColor = '#ff8000';
	calendar.dragBgColor = '#ff8000';
	calendar.borderColor = '#ff8000';
	addCalendar(calendar);

	calendar = new CalendarInfo();
	id += 1;
	calendar.id = String(id);
	calendar.name = 'Offer';
	calendar.color = '#578E1C';
	calendar.bgColor = '#04ba28';
	calendar.dragBgColor = '#04ba28';
	calendar.borderColor = '#04ba28';
	addCalendar(calendar);
})();

(function(window, Calendar) {
	var cal, resizeThrottled;
	var useCreationPopup = true;
	var useDetailPopup = true;

	cal = new Calendar(
		'#calendar',
		{
			defaultView: 'month',
			useCreationPopup: useCreationPopup,
			useDetailPopup: useDetailPopup,
			calendars: CalendarList,
			template: {
				milestone: function(model) {
					return '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + model.bgColor + '">'
						+ model.title + '</span>';
				},
				allday: function(schedule) {
					return getTimeTemplate(schedule, true);
				},
				time: function(schedule) {
					return getTimeTemplate(schedule, false);
				}
			},
			theme: {
				week: {
					today: {
						color: 'red',
					},
				},
			},
		});

	// event handlers
	cal.on({
		'clickMore': function(e) {
			console.log('clickMore', e);
		},
		'clickDayname': function(date) {
			console.log('clickDayname', date);
		},
		'beforeCreateSchedule': function(e) {
			saveNewSchedule(e);
		},
		'beforeUpdateSchedule': function(e) {
			var schedule = e.schedule;
			var changes = e.changes;

			console.log('beforeUpdateSchedule', e);

			cal.updateSchedule(schedule.id, schedule.calendarId, changes);
			refreshScheduleVisibility();
		},
		'beforeDeleteSchedule': function(e) {
			console.log('beforeDeleteSchedule', e);
			cal.deleteSchedule(e.schedule.id, e.schedule.calendarId);
		},
		'clickTimezonesCollapseBtn': function(timezonesCollapsed) {
			console.log('timezonesCollapsed', timezonesCollapsed);

			if (timezonesCollapsed) {
				cal.setTheme({
					'week.daygridLeft.width': '77px',
					'week.timegridLeft.width': '77px'
				});
			} else {
				cal.setTheme({
					'week.daygridLeft.width': '60px',
					'week.timegridLeft.width': '60px'
				});
			}

			return true;
		}
	});

	function _getFormattedTime(time) {
		const date = new Date(time);
		const h = date.getHours();
		const m = date.getMinutes();

		return `${h}:${m}`;
	}

	function getTimeTemplate(schedule, isAllDay) {
		var html = [];
		var start = moment(schedule.start.toUTCString());
		if (!isAllDay) {
			html.push("<strong>" + _getFormattedTime(schedule.start) + "</strong> ");
		}
		if (schedule.isPrivate) {
			html.push('<span class="calendar-font-icon ic-lock-b"></span>');
			html.push(' Private');
		} else {
			if (schedule.isReadOnly) {
				html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
			} else if (schedule.recurrenceRule) {
				html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
			} else if (schedule.attendees.length) {
				html.push('<span class="calendar-font-icon ic-user-b"></span>');
			} else if (schedule.location) {
				html.push('<span class="calendar-font-icon ic-location-b"></span>');
			}
			html.push(" " + schedule.title);
		}

		return html.join('');
	}

	function onClickNavi(e) {
		var action = getDataAction(e.target);

		switch (action) {
			case 'move-prev':
				cal.prev();
				break;
			case 'move-next':
				cal.next();
				break;
			case 'move-today':
				cal.today();
				break;
			case 'move-day-view':
				cal.changeView('day', true);
				break;
			case 'move-week-view':
				cal.changeView('week', true);
				break;
			case 'move-month-view':
				cal.changeView('month', true);
				break;
			default:
				return;
		}

		setRenderRangeText();
		setSchedules();
	}

	function saveNewSchedule(scheduleData) {
		console.log('scheduleData ', scheduleData);
		var calendar = scheduleData.calendar || findCalendar(scheduleData.calendarId);
		var schedule = {
			id: '1',
			title: scheduleData.title,
			start: scheduleData.start,
			end: scheduleData.end,
			category: scheduleData.isAllDay ? "allday" : "time",
			color: calendar.color,
			bgColor: calendar.bgColor,
			dragBgColor: calendar.bgColor,
			borderColor: calendar.borderColor,
			location: scheduleData.location,
		};
		if (calendar) {
			schedule.calendarId = calendar.id;
			schedule.color = calendar.color;
			schedule.bgColor = calendar.bgColor;
			schedule.borderColor = calendar.borderColor;
		}

		cal.createSchedules([schedule]);

		refreshScheduleVisibility();
	}

	function refreshScheduleVisibility() {
		var calendarElements = Array.prototype.slice.call(document
			.querySelectorAll('#calendarList input'));

		CalendarList.forEach(function(calendar) {
			cal.toggleSchedules(calendar.id, !calendar.checked, false);
		});

		cal.render(true);

		calendarElements
			.forEach(function(input) {
				var span = input.nextElementSibling;
				span.style.backgroundColor = input.checked ? span.style.borderColor
					: 'transparent';
			});
	}

	function setRenderRangeText() {
		var renderRange = document.getElementById('renderRange');
		var options = cal.getOptions();
		var viewName = cal.getViewName();
		var html = [];
		if (viewName === 'day') {
			html.push(moment(cal.getDate().getTime()).format('MMM YYYY DD'));
		} else if (viewName === 'month' && (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
			html.push(moment(cal.getDate().getTime()).format('MMM YYYY'));
		} else {
			html.push(moment(cal.getDateRangeStart().getTime()).format('MMM YYYY DD'));
			html.push(' ~ ');
			html.push(moment(cal.getDateRangeEnd().getTime()).format('MMM DD'));
		}
		renderRange.innerHTML = html.join('');
	}

	function setSchedules() {
		cal.clear();
		var schedules = [{
			id: 489273,
			title: 'Workout for 2020-04-05',
			isAllDay: false,
			start: '2023-05-03T11:30:00+09:00',
			end: '2023-05-03T12:00:00+09:00',
			goingDuration: 30,
			comingDuration: 30,
			color: '#ffffff',
			isVisible: true,
			bgColor: '#69BB2D',
			dragBgColor: '#69BB2D',
			borderColor: '#69BB2D',
			calendarId: '1',
			category: 'allday',
			dueDateClass: '',
			customStyle: 'cursor: default;',
			isPending: false,
			isFocused: false,
			isReadOnly: false,
			isPrivate: false,
			location: '',
			attendees: '',
			recurrenceRule: '',
			state: ''
		}];
		cal.createSchedules(schedules);
		refreshScheduleVisibility();
	}

	function setEventListener() {
		$('#menu-navi').on('click', onClickNavi);

		window.addEventListener('resize', resizeThrottled);
	}

	function getDataAction(target) {
		return target.dataset ? target.dataset.action : target.getAttribute('data-action');
	}

	resizeThrottled = tui.util.throttle(function() {
		cal.render();
	}, 50);

	window.cal = cal;

	setRenderRangeText();
	setSchedules();
	setEventListener();
})(window, tui.Calendar);