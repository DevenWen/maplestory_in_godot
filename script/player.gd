extends Node2D

class_name Charactor

# 动作
@export var head_skin = "00012000"
@export var body_skin = "00002000"
@export var flip = true

@export var motion = "stand1" as String
# 动作帧
@export var frame = 0 as int

# 12 个绘制部分
var draw_part = [
	"Body", 
	"Head",
	"Coat", 
	"Pants", 
	"Shoes", 
	"Glove", # 手套
	"Weapon", 
	"Shield", 
	"Cape"
	]

func _ready():
	draw()
	var maker2D = find_child("Marker2D") as Marker2D
	if flip:
		maker2D.scale.x = -1
		
	$Animation.play(motion)

func draw():
	var draw_map = {}
	for part in draw_part:
		var node = find_child(part)
		draw_map = node.draw(draw_map)


func _on_charactor_animation_frame_changed():
	var anim = $Animation
	var frame = anim.frame
	var anim_name = anim.animation
	var texture = anim.sprite_frames.get_frame_texture(anim_name, frame) as Texture2D
	var motion_frame = texture.resource_name
	self.motion = motion_frame.split("#")[0]
	self.frame = int(motion_frame.split("#")[1])
	draw()
	print("frame change!", anim_name, frame)
