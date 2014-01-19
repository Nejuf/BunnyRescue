# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.BunnyUtils =
	monthStringToYears: (monthString, includeMonths) ->
		if typeof monthString == "number"
			months = monthString
		else
			months = parseInt(monthString.match(/\d+/)[0])
			
		years = parseInt(months/12)

		if years < 1
			return months + " months"
		else
			result = years + " years"
			if includeMonths && months % 12 != 0
				result += months % 12 + " months"
			return result

		