import "./application.css";
import "bootstrap";
import { toggleDatepicker } from "../components/booking_form"
import { showMap } from "../components/maps"
import { searchMap } from "../components/maps"
import { autocomplete } from '../components/autocomplete';
import { getLocation } from '../components/location';
import { showLocation } from '../components/location';

const parkingSpaceShow = document.querySelector('.parking_spaces.show');
if (parkingSpaceShow) {
  toggleDatepicker();
  showMap();
}

const parkingSpaceSearch = document.querySelector('.parking_spaces.search');
if (parkingSpaceSearch) {
  searchMap();
}

const home = document.querySelector('.home');
if (home) {
  autocomplete();
}

const location = document.querySelector('.home');
if (location) {
  getLocation();
}
