class WendlerCalc
	attr_reader :weight, :week

	def initialize(weight,week)
		@weight = find_90(weight.to_i)
		@week = week
	end

	def run
		data[week].inject([]) do |result, obj|
			value = [obj[0], round_up(obj)]
			result << value
			result
		end
	end

	private

	def round_up(data)
		new_weight = (weight * data[1]).round
		until new_weight % 2.5 == 0
			new_weight += 1
		end
		new_weight
	end

	def data
		{
			"1" => week_one_data,
			"2" => week_two_data,
			"3" => week_three_data,
			"4" => week_four_data
		}
	end

	def week_one_data
		[
			["5", 0.4],
			["5", 0.5],
			["5", 0.65],
			["5", 0.75],
			["5+", 0.85]
		]
	end

	def week_two_data
		[
			["5", 0.4],
			["5", 0.5],
			["3", 0.70],
			["3", 0.80],
			["3+", 0.90]
		]
	end

	def week_three_data
		[
			["5", 0.4],
			["5", 0.5],
			["5", 0.75],
			["3", 0.85],
			["1+", 0.95]
		]
	end

	def week_four_data
		[
			["5", 0.4],
			["5", 0.5],
			["5", 0.5],
			["5", 0.5],
			["5", 0.6]
		]
	end

	def find_90(weight)
		(0.9 * weight).round
	end
end