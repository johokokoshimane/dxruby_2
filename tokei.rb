﻿class Tokei < Sprite
	def initialize(x,y)
	
		@image=Image.load("image/tokei.png")
		@image.set_color_key(Color::BLACK)
		@x=x
		@y=y
		super(@x, @y, @image)
	end
	
	
end

