require 'dxruby'
require_relative 'pen'
require_relative 'color'
require_relative 'slide'
require_relative 'main20'

class Main19
	def initialize()
				Input.setRepeat( 0, 0 )
						key_codes = {K_A => "PEN",
			K_B => "B",
			K_C => "C",
			K_D => "D",
			K_E => "E",
			K_F => "F",
			K_G => "G",
			K_H => "H",
			K_I => "I",
			K_J => "J",
			K_K => "K",
			K_L => "L",
			K_M => "M",
			K_N => "N",
			K_O => "O",
			K_P => "P",
			K_Q => "Q",
			K_R => "R",
			K_S => "S",
			K_T => "T",
			K_U => "U",
			K_V => "V",
			K_W => "W",
			K_X => "X",
			K_Y => "Y",
			K_Z => "Z"}
str = ""
		# 文字の準備
		font = Font.new(32)
		# ボタン１の準備

		gaga = Image.new(200, 100, [255, 255, 255])
		button_image20 = Image.new(150, 150, [20, 255, 255])
		button20 = Sprite.new(300, 50, gaga)
		button20.image.drawFontEx(0,0,"ペン", font,{color:[255,255,0,0]})
		

		# ボタン3の準備
		


		# カーソルの準備
		cursor_image = Image.new(10, 10, [255, 0, 255, 0])
		cursor = Sprite.new(0, 0, cursor_image)

		pen = Pen.new(0,0)

		# 1ページ目の準備 
		slide = Slide.new
		slide.parts << pen
		slide.parts << button20
		next_page = [slide]
enter = 0
result = false
		Window.loop do
			cursor.draw
			# カーソルの位置を把握
			cursor.x = Input.mousePosX
			cursor.y = Input.mousePosY
			
			
			# 3ページ目のボタン
			if !cursor.check(next_page).empty? && Input.mouse_push?(M_LBUTTON)
				slide = Slide.new()
				next_page = Main20.new
			end
			#
			# 表示するべき次のページが存在するか確認する
			unless next_page.empty?
				# 前のページを上から塗りつぶす
				#Window.draw_box_fill(0, 0, 600, 600, [0, 0, 0])
				# 新たなページにボタンを表示する
				#next_page.map{|n| n.draw }
				Sprite.draw(next_page)
			end
			if Input.keyPush?(Input.keys.first.to_i)
				str += "#{key_codes[Input.keys.first]}"
			end
		
				Window.drawFont(200, 400, "#{str}", font)
				
				# エンターキーが押されたら、「str」と「"apple"」
				enter += 1 if Input.keyPush?( K_RETURN )
				if enter % 2 == 1 then
					puts str
					if str == "PEN"
						i = "正解"
						puts i
						Window.drawFont(300, 500, "#{i}", font)
						result = true
					else
						ii = "不正解"
						puts ii
						Window.drawFont(300, 500, "#{ii}", font)
					end	
					
				end	
				# => 次の画面・やり直し
				if enter % 2 == 0 && Input.keyPush?( K_RETURN )
					str = ""
					if result
						next_page = Main20.new
						result = false
						enter = 0
					end
				end
			end
	end

end

