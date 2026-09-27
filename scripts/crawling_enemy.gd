class_name CrawlingEnemy extends Enemy

#пуля врага
const ENEMY_BULLET = preload("uid://ps6kvdwp3hkq")
#кулдаун для выстрелов врага
@onready var shoot_timer : Timer = $ShootTimer

#в начале игры задаётся скорость врага
func _ready() -> void:
	speed = 50

#появление пули по истечении кулдауна
func _on_shoot_timer_timeout() -> void:
	var bullet_instance = ENEMY_BULLET.instantiate()
	add_sibling(bullet_instance)

	bullet_instance.position = position
	bullet_instance.rotation = rotation
