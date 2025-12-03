extends CharacterBody2D


func _physics_process(delta: float) -> void:
	self.velocity = Vector2(Input.get_axis("left","right"),Input.get_axis("forward","backwards")).normalized() * 300
	move_and_slide()
