-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Discords = {
	["Connect"] = "https://discord.com/api/webhooks/1109291779041280084/B6sU_Hw5VWk0pe4_gy8-uUYoRSaLV7zlr4aT9xSAaMJDWuLqMJNmyOWF-5OkMZgy6EOe",
	["Disconnect"] = "https://discord.com/api/webhooks/1109291845042835496/JdToDLkNYXrReffC0xcbYzRX2HREC_w5B5sRrNXQgpZHEtbnBPj3V-mJjohQP1LDVjjp",
	["Airport"] = "https://discord.com/api/webhooks/1109291915985309727/kWGdpJLLbzb_5z5fG_ccZ1QLYpArELr_j5HIznqAFCCHiItXmq5oKjH5JJZH7OG2B9fZ",
	["Deaths"] = "https://discord.com/api/webhooks/1109291974583914586/MLu_79bo2bP9vNght-H_ek2UeIat3_ogYHOuvzVfFLfGHrrzlH20M3x9eEon3pxeto_j",
	["Police"] = "https://discord.com/api/webhooks/1109292042661670922/hB5h96LMXR8Ej1jnhnw-vdtHSdvMXGYnBBPJ7smmp2mjGvG4CMTIjkaJInycBiGTq_EN",
	["Paramedic"] = "https://discord.com/api/webhooks/1109292095820279999/Tw6eiuGsrhTE6X63yiuc6A2gqVQLSLLiTDjcDkiOlI0O3GARbQHoK0AoJQ81xasZoOsm",
	["Gemstone"] = "https://discord.com/api/webhooks/1109292143392071770/RRuS8xhuDJfRS4oknwwVjHIkLvZpvG_LA51a2NWDT22-vPmBc8RUUcgkfH6NNqqKesR7",
	["Login"] = "https://discord.com/api/webhooks/1109292223411011687/051c44htLBFtV0z8YBgLWlfTgsxfKgFm2a58LMZEoIgWwlXibIu9ceHbKqXg7LfFVo8-"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Discord",function(Hook,Message,Color)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message } }
	}),{ ["Content-Type"] = "application/json" })
end)