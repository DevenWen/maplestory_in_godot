extends Sprite2D

@onready var WZLib = get_node("/root/MapleResources") as MapleResource

# Called when the node enters the scene tree for the first time.
func _ready():
	# 第一步，需要从 xml 文件中解析 xml 文件
	# 获取到 base64 数据
	# 渲染成一个 texture
	# 并赋值给当前对象
	var image = WZLib.get_by_path("Charactor/00002000.img/alert/0/body")
	self.texture = image.data._image.texture


