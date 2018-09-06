// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// Get the context of the canvas element we want to select

var ctx = document.getElementById("myChart").getContext("2d");
var jsonData = $.ajax({
  url: 'http://localhost:4000/plot_csv',
  dataType: 'json',
}).done(function (result) {
  var data = {
    labels: result.times,
    datasets: [
      {
        label: "Time-value graph",
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220s,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: result.values
      }
    ]
  };

// Instantiate a new chart using 'data' (defined below)
  var myNewChart = new Chart(ctx , {
    type: "line",
    data: data, 
  });
});