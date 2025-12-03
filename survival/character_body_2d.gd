extends CharacterBody2D
var timer = 10
var cooldown = 1
func _physics_process(delta: float) -> void:
	if timer >= cooldown:
		timer = 0
	

	self.velocity = Vector2(Input.get_axis("left","right"),Input.get_axis("forward","backwards")).normalized() * 300
	move_and_slide()
	timer += delta
