$(function () {
  $('.min-chart#chartpickup').easyPieChart({
    barColor: "#4caf50",
    onStep: function (from, to, percent) {
      $(this.el).find('.percent').text(Math.round(percent));
    }
  });
});
$(function () {
  $('.min-chart#chartshipped').easyPieChart({
    barColor: "#4caf50",
    onStep: function (from, to, percent) {
      $(this.el).find('.percent').text(Math.round(percent));
    }
  });
});