extends ProgressBar


@onready var Player =$"../.."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.value = Player.Health
	if self.value >= 0:
		
		
	
