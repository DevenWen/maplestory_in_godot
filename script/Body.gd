extends Sprite2D

class_name Body

@onready var WZLib = get_node("/root/MapleResources") as MapleResource

# Called when the node enters the scene tree for the first time.
func draw_recursion(draw_map):
	print("draw body")
	var charactor = self.find_parent("Player") as Charactor
	var wznode = WZLib.get_by_path(
		"Charactor/%s.img/%s/%d/body" % [charactor.body_skin, charactor.motion, charactor.frame])
	
	# 绘制	
	var data = wznode.data
	self.texture = data._image.texture
	var origin = Vector2(-data.origin.X, -data.origin.Y)
	print("body offset", origin, " texture size: ", self.texture.get_size())
	self.position = origin
	self.offset += (self.texture.get_size()/2)
	self.position.y += 32
	print("body position: ", self.position)
	
	
	# 构建 body 的映射数据
	for key in data["map"]["_keys"]:
		var m = data["map"][key]
		draw_map["body/" + key] = Vector2(-m.X, -m.Y)
	
	return draw_map
	
	


