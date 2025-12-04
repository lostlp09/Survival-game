extends ProgressBar

@export var Value = 0
@export var xpclaim:Callable
var Upgrades = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Upgrades = [speed]
	levelup()
	xpclaim = xpclaimed
	pass # Replace with function body.
func levelup()->void:
	get_tree().paused = true
	$"../Node2D".visible = true
	for i:Button in $"../Node2D".get_children():
		Upgrades.pick_random().bind(i,self.get_parent().get_parent()).call()
		spawn(i)
		await  get_tree().create_timer(0.05).timeout

func spawn(button):
	var x = 0
	for runs in range(0,30):
			
			x +=0.01
			button.position.y += easeOutCirc(x) * 40
			print(easeOutCirc(x) * 100)
			await get_tree().create_timer(0.01).timeout
func xpclaimed():
	print("test")
	
	Value += 10
	if Value >= self.max_value:
		Value -= self.max_value
		self.max_value += 20
		levelup()
	
func _process(delta: float) -> void:
	if Value >= self.max_value:
		0
	self.value = Value
	pass
	
func  easeOutCirc(x:float ):
	return sqrt(1 - pow(x - 1, 2))

func speed(button:Button,Player:CharacterBody2D):
	button.text = "speedupgrade"
	pass
	
