extends Sprite2D

class_name Head

@onready var WZLib = get_node("/root/MapleResources") as MapleResource

func draw_recursion(draw_map):
	print("body call arm", draw_map)
	var charactor = self.find_parent("Player") as Charactor
	var wznode = WZLib.get_by_path(
		"Charactor/%s.img/%s/%d/head" % [charactor.head_skin, charactor.motion, charactor.frame])
	
	# 绘制
	var data = wznode.data
	var origin = Vector2(-data.origin.X, -data.origin.Y)
	self.texture = data._image.texture
	
	# 计算映射, head 总是需要 match navel
	var neck = Vector2(-data.map.neck.X, -data.map.neck.Y)
	origin = origin + neck - draw_map["body/neck"]
	self.position = origin
	self.position.y += 32
	self.offset += (self.texture.get_size() / 2)
	
	
	# 保存新的映射数据
	for key in data["map"]["_keys"]:
		var m = data["map"][key]
		draw_map["head/" + key] = Vector2(-m.X, -m.Y)
	
	return draw_map
