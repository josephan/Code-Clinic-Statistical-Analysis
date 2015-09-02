require 'readline'
require 'date'

# The earliest date for which ther eis consistent data.
DATA_START_DATE = '2006-09-20'

# We want to be kin to the remote server. This
# Ask the user (via the command line) to provide valid start date and end date.
def query_user_for_date_range
	start_date = nil
	end_date = nil

	puts "\nFirst, we need a start date."
	start_date = query_user_for_date

	puts "\nNext, we need an end date."
	end_date = query_user_for_date

	return [start_date, end_date]
end

# Ask the user (via the command line) for a single validate date.
def query_user_for_date
	date = nil
	until date.is_a? Date
		prompt = "Please enter a date as YYYY-MM-DD: "
		response = Readline.readline(prompt, true)

		# We have the option to quit any time.
		exit if ['quit', 'exit', 'q', 'x'].include?(response)

		begin
			date = Date.parse(response)
		rescue ArgumentError
			puts "\nInvalid date format"
		end

	end
	return date
end