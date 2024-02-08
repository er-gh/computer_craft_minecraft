term.clear()
term.setCursorPos(1,1)
lamp = peripheral.wrap("right")

red_end = 32767
green_end = 1023
blue_end = 31

red_step = 1024
green_step = 32
blue_step = 1

red = 31744
green = 992
blue = 31

half_red = red_step * 15
half_green = green_step * 15
half_blue = blue_step * 15

color = red + half_blue
color_modifier = 1

lamp.setLampColor(color)

while true do
    if color == red then
        color_modifier = green_step
    end
    if color == red + green then
        color_modifier = -red_step
    end
    if color == green then
        color_modifier = blue_step
    end
    if color == green + blue then
        color_modifier = -green_step
    end
    if color == blue then
        color_modifier = red_step
    end
    if color == red + blue then
        color_modifier = -blue_step
    end
    if color == red + half_blue then
        color_modifier = green_step - red_step
    end
    if color == half_red + half_green + green_step + half_blue then
        color_modifier = red_step - green_step - blue_step
    end
    color = color + color_modifier
    lamp.setLampColor(color)
end

