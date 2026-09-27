class_name Player extends Sprite2D

#скорость игрока
@export var speed : int = 500
#время перезарядки выстелов
@export var cooldown_in_seconds : float = 0.2
#здоровье игрока
@export var health : int = 100000
#пуля 
const BULLET = preload("uid://2f8e62bsutn0")
#таймер для перезарядки
@onready var shoot_cooldown_timer : Timer = $Timer

#движение игрока по полю
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	look_at(get_global_mouse_position())


#реализация отклика кнопок на действия выхода из игры или выстрела 
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		#если нажата кнопка Esc - выход из игры
		if event.is_pressed() and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event is InputEventKey:
		#если нажата кнока Space - выстрел
		if event.is_pressed() and event.is_action("shoot"):
			if shoot_cooldown_timer.is_stopped():
				var bullet_instance = BULLET.instantiate()
				add_sibling(bullet_instance)
				bullet_instance.position = position
				bullet_instance.rotation = rotation
				shoot_cooldown_timer.start(cooldown_in_seconds)

#получение урона
func take_damage(damage: int) -> void:
	health -= damage
	#если здоровье закончилось - игра заканчивается
	if health <= 0:
		get_tree().quit()

#заглушка
func _ready() -> void:
	pass 
