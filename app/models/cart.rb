class Cart

	def initialize(array_of_camp_ids = [])
		@camp_ids = array_of_camp_ids
	end

	def camps
		Camp.where(id: @camp_ids)
	end

end