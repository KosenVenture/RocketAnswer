# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#exp_story_wish_university', ->
  $.ajax(
	type: 'GET'
    url: '/exp_stories/get_depts'
      data: {
        school_id: $(this).val()
      }
    ).done (data) ->
      $('.dept-select').html(data)