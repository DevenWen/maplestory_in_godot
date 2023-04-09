extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_up():
	$Player.play("walk1", 1.5)


func _on_button_2_button_up():
	$Player.play("walk1", 0.8)


func _on_button_3_button_up():
	$Player.play("jump", 1)
