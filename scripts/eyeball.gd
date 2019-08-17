extends KinematicBody2D

export var move_speed = 350
export var gravity = 20
export var less_gravity = 10
export var jump_force = 550
export var rot_speed = (PI/6)
var velo = Vector2()
var drag = 0.5
var rotate = 0

const jump_buffer = 0.08
var time_pressed_jump = 0.0
var time_left_ground = 0.0
var last_grounded = false

var dead = false

onready var hud = $camera/HUD

func _ready():
	global.player = self
	set_physics_process(true)
	pass

func _physics_process(_delta):
	var move_vec = Vector2()
	
	if !dead:
		if Input.is_action_pressed("ui_left"):
			move_vec.x -= 1
		if Input.is_action_pressed("ui_right"):
			move_vec.x += 1
		
		if is_on_wall():
			move_vec.x = 0
			if Input.is_action_pressed("ui_up"):
				move_vec.y -= 1
				if Input.is_action_pressed("ui_right"):
					rotate = 1
				elif Input.is_action_pressed("ui_left"):
					rotate = -1
	
	if is_on_wall():
		velo += move_vec * move_speed - drag * Vector2(0,velo.y)
	else:
		velo += move_vec * move_speed - drag * Vector2(velo.x,0)
	
	var cur_grounded = is_on_floor()
	if !cur_grounded and last_grounded:
		time_left_ground = get_cur_time()
	
	var pressed_jump = Input.is_action_just_pressed("ui_up")
	
	if pressed_jump:
		time_pressed_jump = get_cur_time()
	
	if pressed_jump and cur_grounded:
		jump()
	elif (!last_grounded and cur_grounded and get_cur_time() - time_pressed_jump < jump_buffer):
		jump()
	elif pressed_jump and get_cur_time() - time_left_ground < jump_buffer:
		jump()
	
	if Input.is_action_pressed("ui_up"):
		velo.y += less_gravity
	else:
		velo.y += gravity
	
	if cur_grounded and velo.y > 10:
		velo.y = 10
	
	velo = move_and_slide(velo, Vector2.UP)
	if move_vec.x > 0.0:
		rotate = 1
	elif move_vec.x < 0.0:
		rotate = -1
	
	if cur_grounded:
		if move_vec == Vector2():
			rotate = 0
	
	$Sprite.rotate(rot_speed * rotate)
	
	last_grounded = cur_grounded
	pass

func jump():
	if dead:
		return
	velo.y = -jump_force
	pass

func get_cur_time():
	return OS.get_ticks_msec()/1000.0
	pass

func die():
	dead = true
	pass
	
func _on_detect_area_entered(area):
	if area.is_in_group("electric"):
		area.connect("charged",self,"_get_charged")
	pass # Replace with function body.
	
func _get_charged():
	hud._add_score()
	pass