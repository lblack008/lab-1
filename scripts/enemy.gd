class_name Enemy extends Sprite2D

#скорость
@export var speed : int 
#здоровье
@export var health : int = 20
#урон при взаимодействии с игроком
@export var contact_damage : int = 10
#таймер для нанесения урона через равные промежутки времени
@onready var damage_timer : Timer = $DamageTimer
#определение объекта взаимодействия
var object_in_contact : Node = null
#игрок для преследования
var player : Player

#получение урона
func take_damage(damage: int) -> void:
	health -= damage
	#если здоровье закончилось - враг пропадает
	if health <= 0:
		queue_free()

# движение за игроком
func _process(delta: float) -> void:
	global_position += global_position.direction_to(player.global_position) * speed * delta
	look_at(player.global_position)

#если враг столкнулся с объектом, который является игроком или ящиком
# - он наносит ему урончерез равные промежутки времени, пока не прекратит взаимодействие с ним
func _on_area_2d_area_entered(area: Area2D) -> void:
	var object = area.get_parent()

	if object is Player or object is Box:
		object_in_contact = object
		damage_timer.start()

#как только враг перестаёт взаимодействовать с объектом, таймер, отвечающий за перезарядку ударов врага останавливается
func _on_area_2d_area_exited(area: Area2D) -> void:
	var object = area.get_parent()

	if object is Player or object is Box:
		object_in_contact = null
		damage_timer.stop()

#таймер для ударов врага по объекту
func _on_damage_timer_timeout() -> void:
	if object_in_contact != null:
		object_in_contact.take_damage(contact_damage)
