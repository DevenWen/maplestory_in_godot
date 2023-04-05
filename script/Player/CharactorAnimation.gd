extends AnimatedSprite2D

# 加载所有的动作
# 注册到Animation中
# Player 帧变换信号回调，进行重新绘制
@onready var player = get_parent() as Charactor
@onready var WZLib = get_node("/root/MapleResources") as MapleResource

func _ready():
	# 注册，并加载数据
	var wznode = WZLib.get_by_path("Character/%s.img" % [player.body_skin])
	for motion in wznode.data._keys:
		if motion == "info":
			continue
		create_animation(motion, wznode.children[motion])

func create_animation(animation_name, wznode):
	print("action: ", animation_name)
	self.sprite_frames.add_animation(animation_name)
	for frame in wznode.data._keys:
		var node = wznode.children[frame].data as Dictionary
		var texture = Texture2D.new()
		var delay = node.get("delay", 0)
		var action = node.get("action", animation_name)
		var action_frame = node.get("frame", frame)
		texture.resource_name = "%s#%s"%[action, action_frame]
		
		self.sprite_frames.add_frame(animation_name, texture)
