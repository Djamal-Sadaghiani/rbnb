import "./application.css";
import "bootstrap";
import AOS from "aos";
import { toggleDatepicker } from "../components/booking_form"
import { showMap } from "../components/maps"
import { searchMap } from "../components/maps"
import { autocomplete } from '../components/autocomplete';
import { getLocation } from '../components/location';
import { success } from '../components/location';
import { error } from '../components/location';
import { hi } from '../components/location';

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
  document.getElementById("nearMe").addEventListener("click", getLocation);
  autocomplete();
}

const aossearch = document.querySelector('.parking_spaces.search');
if (parkingSpaceSearch) {
  AOS.init();
}

