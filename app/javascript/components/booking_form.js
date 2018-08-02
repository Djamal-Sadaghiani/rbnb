import flatpickr from 'flatpickr';

const toggleDatepicker = function() {

  const startDateinput = document.getElementById('booking_start_time');
  const endDateinput = document.getElementById('booking_end_time');

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
    enableTime: true,
    dateFormat: 'Y-m-d H:i',
    onChange: function(_, selectedDate) {
      if (selectedDate === '') {
        return endDateinput.disabled = true;
      }
      endDateCalendar.set('minDate', selectedDate);
      endDateinput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateinput, {
         enableTime: true,
        dateFormat: 'Y-m-d H:i',
      });
  }
};

export { toggleDatepicker };
