extends Node2D

class_name Charactor

# 动作
@export var head_skin = "00012000"
@export var body_skin = "00002000"

@export var motion = "stand1"
# 动作帧
@export var frame = 0

func _ready():
	draw()

func draw():
	var draw_map = {}
	var body = find_child("Body") as Body
	draw_map = body.draw_recursion(draw_map)
	var arm = find_child("Arm") as Arm
	draw_map = arm.draw_recursion(draw_map)
	var head = find_child("Head") as Head
	draw_map = head.draw_recursion(draw_map)

		
