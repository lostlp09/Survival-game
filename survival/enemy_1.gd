extends CharacterBody2D


@onready var player =self.get_parent().get_node("Player")
func _physics_process(delta: float) -> void:

	var direction = (player.position - self.position).normalized()
	self.velocity = direction * 150
	move_and_slide()
