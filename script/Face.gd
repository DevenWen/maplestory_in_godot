extends CharacterSprite

class_name FaceSprite

@export var motion = "default"
@export var frame = 0 

var head : HeadSprite

func _ready():
	head = find_parent("Head") as HeadSprite

func draw(draw_map):
	reset()
	var parent = get_parent() as HeadSprite
	if parent.is_back:
		return draw_map
	if head.capvslot.contains("Hd") or head.capvslot.contains("Hb"):
		return draw_map
		
	# 读取 body 的数据；
	# 渲染 body 数据中的 贴图集 
	# 计算 body 的偏移
	var wznode = WZLib.get_by_path("Character/%s/%s/%d" % [self.img, self.motion, self.frame])
	
	# 绘制
	# var data = wznode.data
	# 循环贴图集合
	if typeof(wznode) == TYPE_INT and wznode == MapleResource.NO_FOUND:
		return draw_map
	
	# Face 都是通过 brow 和 Head 进行映射的。因此此处只需要和 Head 进行处理就可以了。
	for key in wznode.children:
		var node = wznode.children[key]
		if node == null: continue
		var value = node.data
		if (MapleResource.is_canvas(value)):
			# 绘制
			var sprite = WZLib.create_sprite(draw_map, value) as Sprite2D
			part_to_sprite[value.z] = sprite
			self.add_child(sprite)
			
	return draw_map
