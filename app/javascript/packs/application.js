// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Alert   from './components/Alert';
import Sidebar from './components/Sidebar';
import Modal   from './components/Modal'
import Tab     from './components/Tab'

document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.c-alert').forEach($alert => { new Alert($alert) });
  document.querySelectorAll('[data-toggle="sidebar"]').forEach($sidebarToggleButton => { new Sidebar($sidebarToggleButton) });
  document.querySelectorAll('[data-toggle="modal"]').forEach($modalToggleButton => { new Modal($modalToggleButton) });
  document.querySelectorAll('.c-tab').forEach(($tab) => { new Tab($tab) });
});
