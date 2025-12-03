extends CharacterBody2D
var timer = 3
var Enemy = null
@export var cooldown  = 1

func _physics_process(delta: float) -> void:

	if timer >= cooldown and $Area2D.has_overlapping_bodies():
		timer = 0
		var shortest_distance = 1000000
		for i in $Area2D.get_overlapping_bodies():
			if i != self:
				if self.position.distance_to(i.position)<= shortest_distance:
					shortest_distance = self.position.distance_to(i.position)
					Enemy = i
				
		var clone = $"../Storage/bullet".duplicate()
		clone.Enemy = Enemy
		clone.process_mode = Node.PROCESS_MODE_INHERIT
		clone.position = self.position
		self.get_parent().add_child(clone)
		Enemy = null
	timer += delta	
	self.velocity = Vector2(Input.get_axis("left","right"),Input.get_axis("forward","backwards")).normalized() * 300
	move_and_slide()
