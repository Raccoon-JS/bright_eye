extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCEL = 50
const SPEED = 400
const JUMP = -600
const ROT = (PI/6)

var rotate = 0
var motion = Vector2()
var remaining = 360
var moving = false

func _ready():
	pass # Replace with function body.

func get_input():
	var friction = false
	if Input.is_action_pressed('ui_right'):
		moving = true
		rotate = 1
		motion.x = min(motion.x + ACCEL, SPEED)
	elif Input.is_action_pressed('ui_left'):
		moving = true
		rotate = -1
		motion.x = max(motion.x - ACCEL, -SPEED)
	else:
		moving = false
		friction = true
		motion.x = 0
		rotate = 0
	# Jump
	if is_on_floor():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
			rotate = 0
	# On the wall
	if is_on_wall():
		motion.x = 0
		if Input.is_action_pressed('ui_up'):
			moving = true
			motion.y = -SPEED
			rotate = 1
			if Input.is_action_pressed('ui_right'):
				rotate = 1
			elif Input.is_action_pressed('ui_left'):
				rotate = -1
	pass

func _physics_process(delta):
	if delta:
			motion.y += GRAVITY
			get_input()
			$Sprite.rotate(ROT * rotate)
			motion = move_and_slide(motion, UP)
	pass