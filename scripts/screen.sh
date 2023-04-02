#!/usr/bin/sh

# Get your display name with xrandr
display="LVDS-1"

# Names of screen inputs, from xinput
touch_input="Wacom ISDv4 E6 Finger"
stylus_input_tip="Wacom ISDv4 E6 Pen Pen (0)"
# The red button on the back of the stylus
stylus_input_eraser="Wacom ISDv4 E6 Pen Eraser (0)"

ctm="Coordinate Transformation Matrix"

# Turns coordinates on their heads
inversion_matrix="-1 0 1 0 -1 1 0 0 1"

# Leaves coordinates as they are
identity_matrix="1 0 0 0 1 0 0 0 1"

# The current screen rotation: One of "normal", "inverted", "left", "right"
cur_rotation=$(xrandr -q --verbose | grep "$display" | cut -d" " -f6)

echo "Let's rotate the screen"
echo "Current rotation is $cur_rotation"

if [ "$cur_rotation" = "normal" ]; then
	echo "Invert the screen and the inputs for touch and stylus"
	xinput set-prop "$stylus_input_tip" "$ctm" $inversion_matrix
	xinput set-prop "$stylus_input_eraser" "$ctm" $inversion_matrix
	xinput set-prop "$touch_input" "$ctm" $inversion_matrix

	xrandr -o inverted
else
	echo "Return the screen and the inputs to normal"
	xinput set-prop "$stylus_input_tip" "$ctm" $identity_matrix
	xinput set-prop "$stylus_input_eraser" "$ctm" $identity_matrix
	xinput set-prop "$touch_input" "$ctm" $identity_matrix

	xrandr -o normal
fi
