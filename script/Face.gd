extends CharacterSprite

class_name FaceSprite

@export var motion = "default"
@export var frame = 0 

func draw(draw_map):
	# 读取 body 的数据；
	# 渲染 body 数据中的 贴图集 
	# 计算 body 的偏移
	var wznode = WZLib.get_by_path("Character/%s/%s/%d" % [self.img, self.motion, self.frame])
	
	# 绘制
	# var data = wznode.data
	# 循环贴图集合
	reset()
	if typeof(wznode) == TYPE_INT and wznode == MapleResource.NO_FOUND:
		return draw_map
		
	for key in wznode.children:
		var node = wznode.children[key]
		if node == null: continue
		var value = node.data
		if (MapleResource.is_canvas(value)):
			# 绘制
			var sprite = WZLib.create_sprite(draw_map, value) as Sprite2D
			self.add_child(sprite)
			
	return draw_map
