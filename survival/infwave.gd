extends Node2D

signal call 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for i in range(0,20):
		var clone= $Storage/Enemy1.duplicate()
		clone.position = Vector2(0,8)
		clone.process_mode = Node.PROCESS_MODE_INHERIT
		self.add_child(clone)
			
		
		await  get_tree().create_timer(1).timeout

		
