extends CanvasLayer

@onready var star_1 = %Star1
@onready var star_2 = %Star2
@onready var star_3 = %Star3
@onready var health_label = %HealthLabel
@onready var money_label = %MoneyLabel
@onready var base= get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")

func victory() -> void:
	visible = true
	if base.max_health == base.current_health:
		star_3.modulate = Color.WHITE
		health_label.visible = true
	if bank.gold >= 500:
		star_2.modulate = Color.WHITE
		money_label.visible = true

func _on_retry_button_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
