extends Sprite2D
@export var  Enemy =  0
@export var Damage = 20
@onready var player
var Xp = preload("res://xp.tscn")

func _ready() -> void:
	player = self.get_parent().get_node("Player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Enemy != null:
		var direction = (Enemy.position - self.position).normalized()
		self.position += direction * 5
		self.look_at(Enemy.position)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == Enemy:
		self.queue_free()
	
		body.get_node("ProgressBar").value -= Damage
		if body.get_node("ProgressBar").value <= 0:
			if player.Health  + player.lifesteal > 100:
				player.Health = 100
			else:
				player.Health += player.lifesteal

			player.Health += player.lifesteal
			for i in range(0,randi_range(3,6)):
				var clone = Xp.instantiate()
				clone.position = body.position +Vector2(0,i * 2)
				self.get_parent().add_child(clone)
				
			body.queue_free()
		
