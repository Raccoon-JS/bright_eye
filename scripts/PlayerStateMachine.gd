extends "res://scripts/StateMachine.gd"

func _ready():
	add_state("idle")
	add_state("run")
	add_state("jump")
	add_state("fall")
	add_state("wall")
	call_deferred("set_state", states.idle)
	pass # Replace with function body.

func _input(event):
	if [states.idle, states.run].has(state):
		var friction = false
		
		# Jump
		if parent.is_on_floor():
			if event.is_action_pressed("ui_up"):
				parent.motion.y = parent.JUMP
				parent.is_jumping = true
			if friction:
				parent.motion.x = lerp(parent.motion.x, 0, 0.2)
		else:
			if friction:
				parent.motion.x = lerp(parent.motion.x, 0, 0.2)
				parent.rotate = 0
		
	# On the wall
	if parent.is_on_wall():
		parent.motion.x = 0
		if event.is_action_pressed('ui_up'):
			parent.on_wall = true
			#parent._apply_gravity(0)
			#parent.moving = true
			parent.motion.y = - parent.SPEED
			#parent.rotate = 1
			if event.is_action_pressed('ui_right'):
				parent.rotate = 1
			elif event.is_action_pressed('ui_left'):
				parent.rotate = -1
		else:
			parent.on_wall = false
	pass

func _state_logic(delta):
	parent._handle_move_input()
	parent._apply_gravity(delta)
	parent._apply_movement()
	pass

func _get_transition(delta):
	if delta:
		match state:
			states.idle:
				if !parent.is_on_floor() and !parent.is_on_wall():
					if parent.motion.y < 0:
						return states.jump
					elif parent.motion.y > 0:
						return states.fall
				elif parent.motion.x != 0:
					return states.run
			states.run:
				if !parent.is_on_wall():
					if !parent.is_on_floor():
						if parent.motion.y < 0:
							return states.jump
						elif parent.motion.y > 0:
							return states.fall
					elif parent.motion.x == 0:
						return states.idle
				else:
					return states.wall
			states.jump:
				if parent.is_on_floor():
					return states.idle
				elif parent.motion.y >= 0:
					return states.fall
			states.fall:
				if parent.is_on_floor():
					return states.idle
				elif parent.motion.y < 0:
					return states.jump
			states.wall:
				if parent.motion.y < 0:
					return states.run
				elif parent.motion.y > 0:
					return states.fall
			
	return null
	pass
"""
func _enter_state(new_state, old_state):
	print(old_state)
	match new_state:
		states.idle:
			print('idle')
		states.run:
			print('run')
		states.jump:
			print('jump')
		states.fall:
			print('fall')
		states.wall:
			print('wall')
	pass
"""
"""
func _exit_state(old_state, new_state):
	old_state = new_state
	state = old_state
	pass
"""