extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("draw line")
	draw_line(Vector2(100, 0), Vector2(100, 100), Color.AQUA)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
