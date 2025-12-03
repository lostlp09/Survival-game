extends Sprite2D

@onready var player = $"../Player"


	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = (player.position - self.position).normalized()
	self.position += direction * 5
	self.look_at(player.position)




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		self.queue_free()
