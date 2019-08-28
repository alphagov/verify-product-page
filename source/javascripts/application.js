//= require gaap-analytics/build/gaap-analytics.min
//= require govuk-frontend/govuk/all.js

document.addEventListener("DOMContentLoaded", function(){
  window.GAAP.analytics.init();
  GOVUKFrontend.initAll();
});