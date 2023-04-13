extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

const coin = preload("res://world/player/peng.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Node3D
@onready var camera := $Node3D/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		$"../pause".visible = true
		
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
	if event.is_action_pressed("peng"):
		var instance = coin.instantiate()
		instance.linear_velocity = -camera.global_transform.basis.z * 2
		instance.angular_velocity = Vector3(randf()*20,randf()*20,randf()*20)
		get_parent().add_child(instance)
		instance.global_position = camera.global_position
func _physics_process(delta):
	var temp = get_node("../Boll").get_overlapping_bodies()
	gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
	for i in temp:
		if i.name == "Player":
			$"../Timer Label".on = false
			gravity = -30
	# Add the gravity.s
	#if not is_on_floor():
	velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("A", "D", "W", "S")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
