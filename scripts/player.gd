extends CharacterBody2D


const SPEED = 135.0
const JUMP_VELOCITY = -275.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

var jump_available = true;

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump_available=true
	
	

	# Handle jump.
	if (Input.is_action_just_pressed("jump") && (!coyote_timer.is_stopped() || is_on_floor()) && jump_available) :
		velocity.y = JUMP_VELOCITY
		jump_available=false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip Sprite
	if direction == 1:
		animated_sprite_2d.flip_h = false;
	if direction == -1:
		animated_sprite_2d.flip_h = true;
	
	
	#Play animations
	if is_on_floor():
		if direction == 0 :
			animated_sprite_2d.play("idle")
		else :
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var was_on_floor = is_on_floor();
	
	move_and_slide()
	
	if (was_on_floor && !is_on_floor()):
		coyote_timer.start();

