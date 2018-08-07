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
import { hi } from '../components/location';
import { bookingMap } from "../components/maps";
import { shownoresultMap } from "../components/maps"
import { showStreet} from "../components/maps";
import { revenueChart } from "../components/revenue_chart";

const bookingMapElement = document.querySelector('.booking-map');
if (bookingMapElement) {
  bookingMap();
}
const parkingSpaceShow = document.querySelector('.parking_spaces.show');
if (parkingSpaceShow) {
  toggleDatepicker();
  showMap();
  showStreet();
}

const bookingShow = document.querySelector('.bookings.show');
if (bookingShow) {
  showMap();
  showStreet();
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

const dashboard = document.querySelector('.pages.dashboard');
if (dashboard) {
  console.log("hello");
  revenueChart();
};

AOS.init();
