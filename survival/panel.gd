extends Panel

var Stylebox = StyleBoxFlat.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = randi_range(0,255)
	var g = randi_range(0,255)
	var b = randi_range(0,255)
	Stylebox.bg_color = Color8(r,g,b)
	self.add_theme_stylebox_override("panel",Stylebox)
	
