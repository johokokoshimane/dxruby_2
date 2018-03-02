require 'dxruby'
require_relative 'ringo'
require_relative 'color'
require_relative 'slide'
require_relative 'main28'

class Main28
	def initialize()

		# 文字の準備
		font = Font.new(32)
		# ボタン１の準備

		yas = Image.new(200, 100, [255, 255, 255])
		button_image30 = Image.new(150, 150, [20, 255, 255])
		button30 = Sprite.new(300, 50, yas)
		button30.image.drawFontEx(0,0,"よくできたね", font,{color:[255,255,0,0]})
		

		# ボタン3の準備
		


		# カーソルの準備
		cursor_image = Image.new(10, 10, [255, 0, 255, 0])
		cursor = Sprite.new(0, 0, cursor_image)

		ringo = Ringo.new(0,0)

		# 1ページ目の準備 
		slide = Slide.new
		slide.parts << button30
		next_page = [slide]
		Window.loop do
			cursor.draw
			# カーソルの位置を把握
			cursor.x = Input.mousePosX
			cursor.y = Input.mousePosY
			
			
			# 3ページ目のボタン
			if !cursor.check(next_page).empty? && Input.mouse_push?(M_LBUTTON)
				slide = Slide.new()
				next_page = Main28.new
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

			end
	end

end

