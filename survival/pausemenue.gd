extends Node2D
var isvisible = false

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test"):
		print("yo")
		isvisible = not isvisible
		$Panel.visible = isvisible 
		get_tree().paused = isvisible
