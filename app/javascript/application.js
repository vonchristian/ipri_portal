// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

import Alpine from "alpinejs"
window.Alpine = Alpine

document.addEventListener("DOMContentLoaded", function(event) {
  window.Alpine.start();
  console.log('est')
});

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }