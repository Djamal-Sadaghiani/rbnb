  import "./application.css";
import "bootstrap";
import AOS from "aos";
import { toggleDatepicker } from "../components/booking_form"
import { showMap } from "../components/maps"
import { searchMap } from "../components/maps"
import { autocomplete } from '../components/autocomplete';
import { autocomplete_city } from '../components/autocomplete';
import { getLocation } from '../components/location';
import { success } from '../components/location';
import { error } from '../components/location';
import { shownoresultMap } from "../components/maps"

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
  autocomplete("search_query");
}

const sign_up = document.querySelector('.registrations.new');
if (sign_up) {
  autocomplete_city("user_city");
}

const aossearch = document.querySelector('.parking_spaces.search');
if (parkingSpaceSearch) {
  shownoresultMap();
}

AOS.init();
