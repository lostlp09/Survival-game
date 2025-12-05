extends CharacterBody2D
var time = 0
@onready var Area2d = $Area2D
@onready var player =self.get_parent().get_node("Player")
func _physics_process(delta: float) -> void:
	time += delta
	var direction = (player.position - self.position).normalized()
	self.velocity = direction * 150
	move_and_slide()
	
	if Area2d.has_overlapping_bodies():
		if time >= 1:
			time = 0
			Area2d.get_overlapping_bodies()[0].Health -= 20
			print("kill")
			
