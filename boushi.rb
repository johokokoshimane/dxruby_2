class Boushi < Sprite
	def initialize(x,y)
	
		@image=Image.load("image/boushi.png")
		@image.set_color_key(Color::BLACK)
		@x=x
		@y=y
		super(@x, @y, @image)
	end
	
	
end

