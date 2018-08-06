import flatpickr from 'flatpickr';

const toggleDatepicker = function() {

  const startDateinput = document.getElementById('booking_start_time');
  const endDateinput = document.getElementById('booking_end_time');
  const pricePerHour = parseFloat(document.getElementById("booking-price").innerHTML);
  let totalPrice = document.getElementById("total-price");

  function timeDiffInHours(startTime, endTime) {
    return ((endTime - startTime) / 3600000);
  };

function priceCalculator(timeDiff) {
  return (timeDiff * pricePerHour)
};

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
    enableTime: true,
    dateFormat: 'Y-m-d H:i',
    onClose: function() {
          let startTime = startDateinput.value;
          let endTime = endDateinput.value;

          if (startTime !== "" && endTime !== "") {
            let result = timeDiffInHours(Date.parse(startTime), Date.parse(endTime));
            let price = priceCalculator(result).toFixed(2);
            totalPrice.innerHTML = price;
          }
        }
  });

    const endDateCalendar =
      flatpickr(endDateinput, {
         enableTime: true,
        dateFormat: 'Y-m-d H:i',
         onClose: function() {
          let startTime = startDateinput.value;
          let endTime = endDateinput.value;

          if (startTime !== "" && endTime !== "") {
            let result = timeDiffInHours(Date.parse(startTime), Date.parse(endTime));
            let price = priceCalculator(result).toFixed(2);
            totalPrice.innerHTML = price;
          }
        }
      });
  }
};

export { toggleDatepicker };
