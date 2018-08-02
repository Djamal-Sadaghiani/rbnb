import "./application.css";
import "bootstrap";
import { toggleDatepicker } from "../components/booking_form"
import { showMap } from "../components/maps"
import { searchMap } from "../components/maps"

const parkingSpaceShow = document.querySelector('.parking_spaces.show');
if (parkingSpaceShow) {
  toggleDatepicker();
  showMap();
}

const parkingSpaceSearch = document.querySelector('.parking_spaces.search');
if (parkingSpaceSearch) {
  searchMap();
}
