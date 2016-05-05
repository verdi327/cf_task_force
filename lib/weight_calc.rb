class WeightCalc
	attr_accessor :weight, :bar_weight, :plates

	def initialize(weight, bar_weight)
		@weight = round_up(weight.to_i)
		@bar_weight = bar_weight.to_i
		@plates = [90.0, 50.0, 30.0, 20.0, 10.0, 5.0]
		@result = {}
	end

	def round_up(weight)
		until weight % 2.5 == 0
			weight += 1
		end
		weight
	end

	def calc
		@weight -= bar_weight # weight in addition to the bar
		return "No Weight Needed" if weight == 0
		return "Weight Must Be Greater Than Bar" if weight < 0
		
		plates.each do |plate|
			unless @weight < plate
				remainder = weight % plate

				div = (weight / plate).to_i
				single_plate = plate == 5.0 ? (plate/2).to_s : (plate / 2).to_i.to_s
				@result[single_plate] = (div*2).to_i

				if remainder == 0	
					break
				else
					@weight = remainder
				end
			end
		end
		@result
	end
end
