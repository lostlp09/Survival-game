extends Node2D

var xptextures = [preload("res://Ohne Namen(2)/Ellipse 22.png"),preload("res://Ohne Namen(2)/Ellipse 24.png"),preload("res://Ohne Namen(2)/Ellipse 23.png"),]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	self.get_node("Sprite2D").texture = xptextures.pick_random()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self.get_parent().get_node("Player"):
		self.queue_free()
		self.get_parent().get_node("Player").get_node("Xpcontrol").get_node("ProgressBar").xpclaim.call()
		
