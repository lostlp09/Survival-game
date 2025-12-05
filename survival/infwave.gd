extends Node2D
@export var nextwavepls:Callable
signal call 
var anzahl = 0
@export var  alive = true
@export var Enemys:Array = []
@export var allspawned = false
func _ready() -> void:
	nextwavepls= nextwave
	while alive == true:
		$Player/Label.text = "Wave:" + str(anzahl +1)
		allspawned = false
		for i in range(0,(anzahl +1) *2):
	
			var clone= $Storage/Enemy1.duplicate()
			clone.position = Vector2(randi_range(-1100,1300),randi_range(-1500,950))
			Enemys.append(clone)
			clone.process_mode = Node.PROCESS_MODE_INHERIT
			self.add_child(clone)
			await  get_tree().create_timer(1).timeout
		allspawned = true	
		anzahl += 1
		await  self.call

func nextwave()->void:
	print("spawning")
	call.emit()
