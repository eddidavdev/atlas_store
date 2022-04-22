// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

//= require jquery

$(document).ready(function(){
    // Turn on js-selectable class so that it becomes SELCT 2 tag
    $('.js-searchable').select2({
      allowClear: true,
      width: '100%',
      placeholder: 'Select a category ...'
    });
  });
