onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sine_generator/clk
add wave -noupdate /sine_generator/fcw
add wave -noupdate /sine_generator/sine
add wave -noupdate /sine_generator/addr
add wave -noupdate /sine_generator/accumulator
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {128547281 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 313
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {128547279 ps} {128547293 ps}
