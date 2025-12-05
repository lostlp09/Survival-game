extends ProgressBar

@export var Value = 0
@export var xpclaim:Callable
var Upgrades = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Upgrades = [speed,damage,regen,morehealth,lifesteal,ploayerspeed]
	levelup()
	xpclaim = xpclaimed
	pass # Replace with function body.
func levelup()->void:
	get_tree().paused = true
	$"../Node2D".visible = true
	for i in range(0,3):
		var Knopf = Button.new()
		Knopf.position = Vector2(500 + 400 * i,-266)
		Knopf.z_index = 100
		Knopf.size = Vector2(300,500)
		$"../Node2D".add_child(Knopf)
		Upgrades.pick_random().bind(Knopf,self.get_parent().get_parent()).call()
		spawn(Knopf)
		await  get_tree().create_timer(0.05).timeout

func spawn(button):
	var x = 0
	for runs in range(0,30):
			
			x +=0.01
			button.position.y += easeOutCirc(x) * 40

			await get_tree().create_timer(0.01).timeout
func xpclaimed():
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

	button.pressed.connect(func remove():
		
		Player.cooldown -= 0.5
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)

func damage(button:Button,Player:CharacterBody2D):
	button.text = "Damage"
	button.pressed.connect(func remove():
		Player.Damage += 1
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)
func regen(button:Button,Player:CharacterBody2D):
	button.text = "Healup"
	button.pressed.connect(func remove():
		Player.Health += 20
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)
func morehealth(button:Button,Player:CharacterBody2D):
	button.text = "More Health"
	button.pressed.connect(func remove():
		$"../Health".max_value +=5
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)
func lifesteal(button:Button,Player:CharacterBody2D):
	button.text = "life steal"
	button.pressed.connect(func remove():
		Player.lifesteal += 2
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)
func ploayerspeed(button:Button,Player:CharacterBody2D):
	button.text = "Player speed"
	button.pressed.connect(func remove():
		Player.speed+= 0.1
		get_tree().paused = false
		$"../Node2D".visible = false
		for i in $"../Node2D".get_children():
			i.queue_free()
		)
