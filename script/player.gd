extends Node2D

class_name Charactor

# 动作
@export var head_skin = "00012000"
@export var body_skin = "00002000"

@export var motion = "stand1" as String
# 动作帧
@export var frame = 0 as int

func _ready():
	draw()
	var maker2D = find_child("Marker2D") as Marker2D
	maker2D.scale.x = -1

func draw():
	var draw_map = {}
	var body = find_child("Body") as CharactorSprite
	draw_map = body.draw(draw_map) 
	var head = find_child("Head")  as CharactorSprite
	draw_map = head.draw(draw_map)
	var face = find_child("Face") as FaceSprite
	draw_map = face.draw(draw_map)
	# draw_map = body.draw_recursion(draw_map)
	# var arm = find_child("Arm") as Arm
	# draw_map = arm.draw_recursion(draw_map)
	# var head = find_child("Head") as Head
	# draw_map = head.draw_recursion(draw_map)
