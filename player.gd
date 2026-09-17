class_name Player extends Sprite2D

#переменная скорости игрока
@export var speed : int = 500
#переменная времени перезарядки выстрелов
@export var cooldown_in_seconds : float = 0.2
#переменная самой пули 
const BULLET = preload("uid://ctnvv7o2dra57")
#таймер для перезарядки
@onready var shoot_cooldown_timer : Timer = $Timer

#функция, в которой запускается автостарт таймера перезарядки таймера
func _ready() -> void:
	shoot_cooldown_timer.autostart = true
	pass 

#функция для взаимодействия с перемещением игрока 
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


#функция для выполнения действий в зависимости от ввода 
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event is InputEventKey:
		if event.is_pressed() and event.is_action("shoot"):
			if shoot_cooldown_timer.is_stopped():
				var bullet_instance = BULLET.instantiate()
				add_sibling(bullet_instance)
				bullet_instance.position = position
				bullet_instance.rotation = rotation
				shoot_cooldown_timer.start(cooldown_in_seconds)
			
