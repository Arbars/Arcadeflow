function returngly(){
	local uniglyph = [" ","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
	return (uniglyph)
}

local uniglyphs = returngly()

function gly(index){
	local unizero = 0xe900
	try {return (uniglyphs[index - unizero + 1])} catch (err) {return ""}
}

local bar_font =  "fonts/font_glyphs.ttf"
local bar_pic = fe.add_text("",0,0,300,300)
bar_pic.font = bar_font
bar_pic.margin = 0
bar_pic.align = Align.MiddleCentre
bar_pic.charsize = 200
bar_pic.zorder = 100000
bar_pic.word_wrap = true
bar_pic.set_bg_rgb(200,0,0)

local bar_thread = null

local arr = array(1000000,1)

local bar_pos = 0
local bar_redraw = false
local bar_time0 = 0
local bar_time1 = 0

function bar_run(functiontorun){
	bar_thread = newthread(functiontorun)
	bar_thread.call()
}

function bar_init(){
	bar_redraw = true
	bar_time0 = clock()
	bar_time1 = bar_time0
}


function bar_update(i, max){
	bar_time1 = clock()
	if ((floor(10*i*1.0/max) != bar_pos) && (bar_time1 - bar_time0 >= 1.0/ScreenRefreshRate)) {
		bar_pos = floor(10*i*1.0/max)
		bar_time0 = bar_time1
		suspend()
	}
}

function bar_close(){
	bar_pos = 10
	suspend()
	bar_redraw = false
}

function refresher_X(){
	bar_init()
	foreach (i, item in arr){
		// DO SOMETHING HERE
		bar_update(i,arr.len())
	}
	bar_close()
}

function refresher_Y(){
	bar_init()
	foreach (i, item in arr){
		// DO SOMETHING ELSE
		bar_update(i,arr.len())
	}
	bar_close()
}


fe.add_signal_handler( "on_signal" )
fe.add_transition_callback( "on_transition" )
fe.add_ticks_callback(  "tick" )

function on_transition( ttype, var0, ttime ) {
	return false
}

function tick( tick_time ) {
	if (bar_redraw) {
		print(bar_pos+"\n")
		bar_pic.msg = gly(0xeafb+bar_pos)
		bar_thread.wakeup()
		return //only update bar
	}
}

function on_signal( sig ){
	if (bar_redraw) return //no signals when bar is running

	if (sig == "custom1") bar_run(refresher_X)
	if (sig == "custom2") bar_run(refresher_Y)

	return false
}