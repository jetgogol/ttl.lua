#!/usr/bin/lua

-- Translate to language
require("translate")
require("split")

l1, l2, s = ...
if l1 == nil then
	l1 = "en"
end
if l2 == nil then
	l2 = "en"
end

function switch_fromto(args)
	l1 = args[2]
	l2 = args[3]
end

function xclip(args)
	os.execute("echo -n "..last_out.."|xclip -selection c")
end

function quit(args)
	os.exit()
end

function swap(args)
	l1,l2 = l2,l1
end

commands = {
	ft = switch_fromto,
	['from-to'] = switch_fromto,
	c = xclip,
	['copy'] = xclip,
	['q'] = quit,
	['quit'] = quit,
	s = swap,
	['swap'] = swap
}

last_out = nil

if s ~= nil then
	print(translate(s, l1, l2))
	os.exit(0)
end

while true do
	::input::
	input = io.read()
	if input == nil then
		quit(nil)
	end

	prefix = string.sub(input,1,1)
	if prefix == "/" or prefix == ":" then
		command = string.sub(input,2)
		args = split(command, " ")
		if commands[args[1]] then
			commands[args[1]](args)
		else
			-- Move readme.info to readme.1
			print('\''..args[1]..'\''..' is not a ttl command. See \'readme.html\'.')
		end
		goto input
	end
	
	last_out = translate(input, l1, l2)
	print(last_out)
end
