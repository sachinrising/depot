module ApplicationHelper

	def getTime
		@time = Time.now

		hour = @time.hour

		minute = @time.strftime("%M")

		second = @time.strftime("%S")

		hFormat = "AM"

		hFormat = "PM" if hour >= 12

		hour = hour - 12 if hour > 12

		"#{hour}:#{minute}:#{second} #{hFormat}"
	end
end
