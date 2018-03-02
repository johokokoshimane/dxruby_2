class Slide < Sprite
	attr_accessor :parts
	
	def initialize()
		@parts = []
		@image = Image.new(600, 600, [0, 0, 0])
		super(0, 0, @image)
	end
	
	def draw
		super
		Sprite.draw(@parts)
	end
	
end