class_name Level1 extends Node2D

#игрок
const PLAYER = preload("uid://bi1ho2eupc2xa")
#медленный враг, делающий выстрелы 
const CRAWLING_ENEMY = preload("uid://j7p3jm6y7ky4")
#быстрый враг
const FAST_ENEMY = preload("uid://c5l5ammoih43v")
#игрок
var player : Player

#появление игрока и врагов на уровне
func _ready() -> void:
	var player_instance = PLAYER.instantiate()
	add_child(player_instance)
	player = player_instance 
	
	_spawn_enemies()

#создание новых врагов по истечении определённого времени
func _on_spawn_timer_timeout() -> void:
	_spawn_enemies()
	
#спавн врагов
func _spawn_enemies() -> void:
	var crawling_enemy_instance = CRAWLING_ENEMY.instantiate()
	add_child(crawling_enemy_instance)
	crawling_enemy_instance.player = player
	
	var fast_enemy_instance = FAST_ENEMY.instantiate()
	add_child(fast_enemy_instance)
	fast_enemy_instance.player = player
