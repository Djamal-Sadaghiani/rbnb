import "./application.css";
import "bootstrap";
import { toggleDatepicker } from "../components/booking_form"



const parkingSpaceShow = document.querySelector('.parking_spaces.show');
if (parkingSpaceShow) {
  toggleDatepicker();
}
