	# replace the V1.6 on startup screen with our own ID

	.org 0x3000

replace_0x1ce4:
	.ascii "F002"

