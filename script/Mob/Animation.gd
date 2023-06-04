extends AnimatedSprite2D

# 加载所有的动作
# 注册到Animation中
# Player 帧变换信号回调，进行重新绘制
# @onready var player = get_parent() as Charactor
@onready var WZLib = get_node("/root/MapleResources") as MapleResource
@onready var mob: Mob
@onready var img: String

func _ready():
	# 注册，并加载数据
	mob = owner as Mob
	img = mob.img
	var wznode = WZLib.get_by_path("Mob/%s.img"%[img])
	if WZLib.is_load_mod_already(img):
		print_debug("loaded %s aleady."%[img])
		return
	
	WZLib.add_load_mod_already(img)
	for motion in wznode.data._keys:
		if motion == "info":
			continue
		var animation_name = "%s@%s"%[img, motion]
		create_animation(animation_name, motion, wznode.children[motion])

func create_animation(animation_name, motion, wznode):
	# 已经加载过的 img，就不要再执行重复加载
	self.sprite_frames.add_animation(animation_name)
	self.sprite_frames.set_animation_speed(animation_name, 30)
	var fps = self.sprite_frames.get_animation_speed(animation_name)
	for _frame in wznode.data._keys:
		# 加入不是 frame 值，就可以直接跳過
		if wznode.children[_frame] == null:
			continue
			
		var node = wznode.children[_frame].data as Dictionary
		var texture = Texture2D.new()
		var _delay = node.get("delay", 0)
		var action = node.get("action", motion)
		var action_frame = node.get("frame", _frame)
		texture.resource_name = "%s#%s"%[action, action_frame]
		
		var relation_duration = fps / (1000.0 / abs(int(_delay)))
		# TODO 需要校准 delay 的动画时延
		self.sprite_frames.add_frame(animation_name, texture, relation_duration)
		
