extends HSlider



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../../../AudioStreamPlayer2D".volume_db = self.value -80
	$Label2.text = str(self.value)
