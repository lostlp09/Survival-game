extends CharacterBody2D
var timer = 3
var Enemy = null
@export var  Damage = 20
@export var cooldown  = 0.1
@export var Health = 100
@export var lifesteal = 1
@export var speed = 1
@onready var  Katana = preload("res://katana_2.tscn")
@onready var root = $".."
@export var circleshootmode = false
var audiofile = preload("res://sound.tscn")

func _physics_process(delta: float) -> void:
	


	if timer >= cooldown and $Area2D.has_overlapping_bodies():
		self.add_child(audiofile.instantiate())
		timer = 0
		if circleshootmode == false:
			var shortest_distance = 1000000
			for i in $Area2D.get_overlapping_bodies():
				if i != self:
					if self.position.distance_to(i.position)<= shortest_distance:
						shortest_distance = self.position.distance_to(i.position)
						Enemy = i
					
			var clone = $"../Storage/bullet".duplicate()
			clone.Enemy = Enemy
			clone.Damage = Damage
			clone.process_mode = Node.PROCESS_MODE_INHERIT
			clone.position = self.position
			self.get_parent().add_child(clone)

			Enemy = null
		else:
			circlekatana()
	timer += delta	
	self.velocity = Vector2(Input.get_axis("left","right"),Input.get_axis("forward","backwards")).normalized() * 300 * speed
	move_and_slide()                                                                                      #bottom 
var Aray= [Vector2(0,150) *-1,Vector2(-106.565,106.565) * -1,Vector2(150,0),Vector2(106.565,106.565),Vector2(0,150) ,Vector2(-106.565,106.565),Vector2(150,0) * -1,Vector2(106.565,106.565) * -1]
func circlekatana()->void:
	
	var rotationdegrees = 180
	for i in Aray:
		
		var clone = Katana.instantiate()
		root.add_child.call(clone)
		clone.position = self.position + i
		clone.rotation_degrees = rotationdegrees
		
		rotationdegrees +=45
		
		
