extends CharacterBody2D

@onready var player =$"../Player"
func _physics_process(delta: float) -> void:
	var direction = (player.position - self.position).normalized()
	self.velocity = direction * 30
	move_and_slide()
