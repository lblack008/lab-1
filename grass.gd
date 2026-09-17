class_name Level1 extends Node2D

#переменная игрока
const PLAYER = preload("uid://bi1ho2eupc2xa")

#функция для появления игрока на уровне
func _ready() -> void:
	var player_instance = PLAYER.instantiate()
	add_child(player_instance)
	pass 

#заглушка
func _process(delta: float) -> void:
	pass
