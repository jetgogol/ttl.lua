local json = require("json")
local http = require("socket.http")
local url  = require("socket.url")

function translate(s1,lang1,lang2)
	local function make_url(input, sl, tl)
		return 'http://translate.googleapis.com/translate_a/single?client=gtx&sl='..sl..'&tl='..tl..'&dt=t&q='..url.escape(input)
	end
	
	tr_url = make_url(s1, lang1, lang2)
	reply = http.request(tr_url)
	data = json.decode(reply)
	for i,v in ipairs(data) do
		output = v[1][1]
	end

	return output
end
