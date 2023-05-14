extends Container

@onready var animation: AnimatedSprite2D
@onready var WZLib = get_node("/root/MapleResources") as MapleResource

func reset():
	for child in self.get_children():
		if child.is_class("Sprite2D"):
			child.queue_free()

func _ready():
	animation = find_parent("Animation")

func _on_animation_frame_changed():
	_on_animation_animation_changed()

func _on_animation_animation_changed():
	# TODO 绘制贴图
	# pass # Replace with function body.
	reset()
	draw()

func draw():
	var anim = animation
	var img = anim.img
	var frame = anim.frame
	var anim_name = anim.animation
	
	var wznode = WZLib.get_by_path("Mob/%s.img/%s/%d"%[anim.img, anim_name, frame])
	
	if typeof(wznode) == TYPE_INT and wznode == MapleResource.NO_FOUND:
		print("wznode nofound:", anim.img, ", ", anim_name, ", ", frame)
		return
	
	if (MapleResource.is_canvas(wznode.data)):
		var sprite = WZLib.create_sprite({}, wznode.data) as Sprite2D
		self.add_child(sprite)
		
	
	



