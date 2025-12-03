extends Sprite2D
@export var  Enemy =  0
@onready var player =$"../../Player"
var Xp = preload("res://xp.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Enemy != null:
		var direction = (Enemy.position - self.position).normalized()
		self.position += direction * 5
		self.look_at(Enemy.position)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == Enemy:
		self.queue_free()
	
		body.get_node("ProgressBar").value -= 20
		if body.get_node("ProgressBar").value <= 0:
			
			for i in range(0,randi_range(3,6)):
				var clone = Xp.instantiate()
				clone.position = body.position +Vector2(0,i * 2)
				self.get_parent().add_child(clone)
			body.queue_free()
		
