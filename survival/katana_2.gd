extends  Sprite2D
var time = 0
func _process(delta: float) -> void:
	time += delta
	if time >= 4:
		self.queue_free()
	self.position += Vector2(0,10).rotated(self.rotation)
	

@export var  Enemy =  0
@export var Damage = 20
@onready var player 
var enemyfound = false

var Xp = preload("res://xp.tscn")

func _ready() -> void:
	player = self.get_parent().get_node("Player")
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):

		body.get_node("ProgressBar").value -= Damage
		if body.get_node("ProgressBar").value <= 0:
			self.get_parent().Enemys.erase(body)
			if self.get_parent().allspawned == true and self.get_parent().Enemys.size() == 0:
				self.get_parent().nextwavepls.call()
	

			if player.Health  + player.lifesteal >player.get_node("Xpcontrol").get_node("Health").max_value:
				player.Health = player.get_node("Xpcontrol").get_node("Health").max_value
			else:
				player.Health += player.lifesteal
				player.Health += player.lifesteal
			for i in range(0,randi_range(3,6)):
				var clone = Xp.instantiate()
				clone.position = body.position +Vector2(0,i * 10)
				self.get_parent().add_child(clone)
			body.queue_free()

	

	
	
