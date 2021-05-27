extends CanvasLayer

signal start_game

func _ready():
	$ScoreLabel.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "PiPG lab\nGame #1"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	$ScoreLabel.hide()

func update_score(score):
	$ScoreLabel.text = str(score)	

func _on_StartButton_pressed():
	$StartButton.hide()
	$ScoreLabel.show()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
