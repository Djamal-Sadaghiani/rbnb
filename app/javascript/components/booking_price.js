
const pricePerHour = document.getElementById("booking-price");
let startTime = document.getElementById("booking_start_time");
let endTime = document.getElementById("booking_end_time");


startTime.addEventListener("input", function() {
  startTimeDate = document.getElementById("booking_start_time").value;
};

endTime.addEventListener("input", function() {
  endTimeDate = document.getElementById("booking_end_time").value;
};

const priceCalculator = function () {
  console.log(startTimeDate);
  console.log(endTimeDate);
};

export { priceCalculator };
