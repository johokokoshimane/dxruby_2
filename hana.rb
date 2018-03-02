class Hana < Sprite
	def initialize(x,y)
	
		@image=Image.load("image/hana.png")
		@image.set_color_key(Color::BLACK)
		@x=x
		@y=y
		super(@x, @y, @image)
	end
	
	
end

