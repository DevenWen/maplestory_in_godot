extends Sprite2D

class_name Arm

@onready var WZLib = get_node("/root/MapleResources") as MapleResource

func draw_recursion(draw_map):
	print("body call arm", draw_map)
	var charactor = self.find_parent("Player") as Charactor
	var wznode = WZLib.get_by_path(
		"Charactor/%s.img/%s/%d/arm" % [charactor.body_skin, charactor.motion, charactor.frame])
	
	# 绘制
	var data = wznode.data
	var origin = Vector2(-data.origin.X, -data.origin.Y)
	self.texture = data._image.texture
	
	# 计算映射, arm 总是需要 match navel
	var navel = Vector2(-data.map.navel.X, -data.map.navel.Y)
	origin = origin + navel - draw_map["body/navel"]
	print("Arm offset: ", origin, "Arm size: ", self.texture.get_size())
	self.position = origin
	self.position.y += 32
	print("arm position: ", self.position) # 坐标已经和 phaser 代码一致，但是粘贴结果不一致
	self.offset += (self.texture.get_size() / 2)
	
	
	# 保存新的映射数据
	for key in data["map"]["_keys"]:
		var m = data["map"][key]
		draw_map["arm/" + key] = Vector2(-m.X, -m.Y)
	
	return draw_map
	# TODO 递归调用 hand
	


