extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# 第一步，需要从 xml 文件中解析 xml 文件
	# 获取到 base64 数据
	# 渲染成一个 texture
	# 并赋值给当前对象
	var file = FileAccess.open("res://assets/Charactor/00002000.img.xml.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file = null
	var image = data["alert"]["0"]["body"]["_image"]
	print(image)
	# var image_ = Image.create_from_data(image.width, image.height, false, Image.F, Marshalls.base64_to_raw(image.uri))
	var image_ = Image.new()
	image_.load_png_from_buffer(Marshalls.base64_to_raw(image.uri))
	print(image_)
	texture = ImageTexture.create_from_image(image_)


