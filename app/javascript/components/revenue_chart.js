function revenueChart () {
  var ctx = document.getElementById('myChart').getContext('2d');


  const data =  {
    labels: ["221 Baker street", "213 Picadilly Circus", "543 Regents street", "534 Canada Water", "Other"],
    datasets: [{
        label: "My First dataset",
        backgroundColor: ['rgb(31, 186, 214)', 'rgb(34, 34, 51)', 'rgb(22, 22, 41)', 'rgb(9, 9, 26)', 'rgb(192, 192, 200)'],
        borderColor: 'rgb(0, 0, 0)',
        data: [560, 430, 230, 140, 1500],
    }]
  };

  var myDoughnutChart = new Chart(ctx, {
      type: 'doughnut',
      data: data,
      options: {
        legend: {
          position: "left",
        },
        layout: {
          padding: {
              left: 0,
              right: 0,
              top: 15,
              bottom: 200
          }
        }
      }
  })


};

export { revenueChart };
