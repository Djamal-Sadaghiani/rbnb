function getLocation() {
    if (navigator.geolocation) {
        const position = navigator.geolocation.getCurrentPosition(success, error);
        console.log(position);
    } else {
        console.log("Geolocation is not supported by this browser.");
    }
}

function success(pos) {
  const crd = pos.coords;
  window.location.href = `/parkingspaces/search?cord=${crd.latitude} ${crd.longitude}`;
  console.log('Your current position is:');
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
  console.log(`More or less ${crd.accuracy} meters.`);
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}

export { getLocation };
export { success };
export { error };
export { hi };
