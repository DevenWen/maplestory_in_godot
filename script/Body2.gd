extends Container

class_name Body2

@onready var WZLib = get_node("/root/MapleResources") as MapleResource

# Called when the node enters the scene tree for the first time.
func draw(draw_map):
	print("draw body")
	var charactor = self.find_parent("Player") as Charactor
	var wznode = WZLib.get_by_path(
		"Charactor/%s.img/%s/%d/body" % [charactor.body_skin, charactor.motion, charactor.frame])
	
	# 绘制	
	var sprite = Sprite2D.new()
	var data = wznode.data
	sprite.texture = data._image.texture
	var origin = Vector2(-data.origin.X, -data.origin.Y)
	print("body offset", origin, " texture size: ", sprite.texture.get_size())
	sprite.position = origin
	sprite.offset += (sprite.texture.get_size()/2)
	# sprite.position.y += 32
	print("body position: ", sprite.position)
	
	
	# 构建 body 的映射数据
	for key in data["map"]["_keys"]:
		var m = data["map"][key]
		draw_map["body/" + key] = Vector2(-m.X, -m.Y)
	
	self.add_child(sprite)
	
	return drawArm(draw_map)
	
func drawArm(draw_map):
	print("draw body")
	var charactor = self.find_parent("Player") as Charactor
	var wznode = WZLib.get_by_path(
		"Charactor/%s.img/%s/%d/arm" % [charactor.body_skin, charactor.motion, charactor.frame])
	
	# 绘制	
	var sprite = Sprite2D.new()
	var data = wznode.data
	sprite.texture = data._image.texture
	var origin = Vector2(-data.origin.X, -data.origin.Y)
	var navel = Vector2(-data.map.navel.X, -data.map.navel.Y)
	origin = origin + navel - draw_map["body/navel"]
	print("arm offset", origin, " texture size: ", sprite.texture.get_size())
	sprite.position = origin
	sprite.offset += (sprite.texture.get_size()/2)
	# sprite.position.y += 32
	print("arm position: ", sprite.position)
	
	
	# 构建 body 的映射数据
	for key in data["map"]["_keys"]:
		var m = data["map"][key]
		draw_map["arm/" + key] = Vector2(-m.X, -m.Y)
	
	self.add_child(sprite)
	
	return draw_map


