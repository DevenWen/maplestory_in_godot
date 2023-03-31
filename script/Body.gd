extends Container

class_name CharactorSprite

@export var img = "00012000.img"
@onready var WZLib = get_node("/root/MapleResources") as MapleResource
@onready var charactor = find_parent("Player") as Charactor

func draw(draw_map):
	# 读取 body 的数据；
	# 渲染 body 数据中的 贴图集 
	# 计算 body 的偏移
	var wznode = WZLib.get_by_path("Character/%s/%s/%d" % [self.img, charactor.motion, charactor.frame])
	
	# 绘制
	# var data = wznode.data
	# 循环贴图集合
	for key in wznode.children:
		var node = wznode.children[key]
		if node == null: continue
		var value = node.data
		if (MapleResource.is_canvas(value)):
			# 绘制
			var sprite = WZLib.create_sprite(draw_map, value) as Sprite2D
			self.add_child(sprite)
			
	return draw_map
