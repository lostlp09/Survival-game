extends Sprite2D
@export var  Enemy =  0
@onready var player =$"../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Enemy != null:
		var direction = (Enemy.position - self.position).normalized()
		self.position += direction * 50
		self.look_at(Enemy.position)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == Enemy:
		self.queue_free()
