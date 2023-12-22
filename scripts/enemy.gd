extends PathFollow3D
@export var speed := 5.0
@export var max_health := 50
@export var gold_value := 15

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var current_health : int : 
	set(health_in):
		if health_in < current_health:
			play_damage_anim()
		current_health = health_in
		if current_health < 1:
				var bank = get_tree().get_first_node_in_group("bank")
				bank.gold += gold_value
				queue_free()

func _ready() -> void:
	current_health = max_health
	
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false)

func play_damage_anim()->void:
	if animation_player:
		animation_player.play("TakeDamager")