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
	"Face",
	"Hair", 
#	"Longcoat",
	"Coat", 
	"Pants", 
	"Shoes", 
	"Cap", 
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

func draw():
	var draw_map = {}
	for part in draw_part:
		var node = find_child(part)
		draw_map = node.draw(draw_map)
