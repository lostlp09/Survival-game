extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self.get_parent().get_node("Player"):
		self.queue_free()
		self.get_parent().get_node("Player").get_node("Xpcontrol").get_node("ProgressBar").xpclaim.call()
