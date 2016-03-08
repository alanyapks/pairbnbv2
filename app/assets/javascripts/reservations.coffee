# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
 $('#reservation_check_in').datepicker({ dateFormat: 'dd-mm-yy' })
jQuery ->
 $('#reservation_check_out').datepicker({ dateFormat: 'dd-mm-yy' })