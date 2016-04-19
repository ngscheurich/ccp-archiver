//= require jquery
//= require jquery_ujs
//= require jquery.menu-aim
//= require dashboard
//= require_tree .

jQuery(document).ready(function() {
  var storiesNum = $('#stories-imported .panel__content');
  var storiesPie = $('#stories-total .panel__content .ct-chart');
  storiesNum.css('line-height', storiesPie.css('height'));
});
