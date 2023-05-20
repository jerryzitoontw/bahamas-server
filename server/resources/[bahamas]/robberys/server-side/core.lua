-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("robberys",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Robberype = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
local Robberys = {
	["1"] = {
		["Coords"] = vec3(28.18,-1338.87,28.96),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["2"] = {
		["Coords"] = vec3(2548.94,384.86,108.08),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["3"] = {
		["Coords"] = vec3(1159.21,-314.07,68.67),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["4"] = {
		["Coords"] = vec3(-710.03,-904.15,18.68),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["5"] = {
		["Coords"] = vec3(-43.66,-1748.17,28.88),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["6"] = {
		["Coords"] = vec3(378.2,333.7,103.04),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["7"] = {
		["Coords"] = vec3(-3250.35,1004.41,12.29),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["8"] = {
		["Coords"] = vec3(1734.92,6421.14,34.49),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["9"] = {
		["Coords"] = vec3(546.51,2662.5,41.62),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["10"] = {
		["Coords"] = vec3(1959.08,3749.17,31.8),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["11"] = {
		["Coords"] = vec3(2672.48,3286.75,54.7),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["12"] = {
		["Coords"] = vec3(1708.07,4920.69,41.51),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["13"] = {
		["Coords"] = vec3(-1829.41,798.56,137.66),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["14"] = {
		["Coords"] = vec3(-2959.63,386.81,14.01),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["15"] = {
		["Coords"] = vec3(-3048.12,585.49,7.38),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["16"] = {
		["Coords"] = vec3(1126.69,-979.12,45.5),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["17"] = {
		["Coords"] = vec3(1170.28,2717.84,37.24),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["18"] = {
		["Coords"] = vec3(-1478.14,-376.05,39.28),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["19"] = {
		["Coords"] = vec3(-1221.65,-916.57,11.49),
		["name"] = "Loja de Departamento",
		["type"] = "department",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card01",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["23"] = {
		["Coords"] = vec3(1693.55,3761.65,34.89),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["24"] = {
		["Coords"] = vec3(252.91,-51.65,70.13),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["25"] = {
		["Coords"] = vec3(841.07,-1034.81,28.38),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["26"] = {
		["Coords"] = vec3(-330.32,6085.58,31.64),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["27"] = {
		["Coords"] = vec3(-660.91,-934.05,22.02),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["28"] = {
		["Coords"] = vec3(-1304.93,-395.83,36.88),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["29"] = {
		["Coords"] = vec3(-1117.63,2700.31,18.74),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["30"] = {
		["Coords"] = vec3(2566.59,293.08,108.92),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["31"] = {
		["Coords"] = vec3(-3172.56,1089.45,21.03),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["32"] = {
		["Coords"] = vec3(23.69,-1106.43,29.98),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	["33"] = {
		["Coords"] = vec3(808.86,-2158.55,29.81),
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["cooldown"] = 1800,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card02",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 30000, ["max"] = 45000 }
		}
	},
	------
	["34"] = {
		["Coords"] = vec3(138.26,-1703.16,29.52),
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["cooldown"] = 1000,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card04",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 19000, ["max"] = 25000 }
		}
	},
	["35"] = {
		["Coords"] = vec3(1217.35,-471.91,66.48),
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["cooldown"] = 1000,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card04",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 19000, ["max"] = 25000 }
		}
	},
	["36"] = {
		["Coords"] = vec3(-1278.18,-1115.05,7.23),
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["cooldown"] = 1000,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card04",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 19000, ["max"] = 25000 }
		}
	},
	["37"] = {
		["Coords"] = vec3(-821.63,-183.72,37.54),
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["cooldown"] = 1000,
		["duration"] = 300,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card04",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 19000, ["max"] = 25000 }
		}
	},
	["38"] = {
		["Coords"] = vec3(-1210.46,-336.45,38.10),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["39"] = {
		["Coords"] = vec3(-353.54,-55.44,49.36),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["40"] = {
		["Coords"] = vec3(311.51,-284.59,54.48),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["41"] = {
		["Coords"] = vec3(147.18,-1046.23,29.68),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["42"] = {
		["Coords"] = vec3(-2956.50,482.09,16.01),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["43"] = {
		["Coords"] = vec3(1175.69,2712.89,38.41),
		["name"] = "Banco Fleeca",
		["type"] = "fleeca",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 225000, ["max"] = 250000 }
		}
	},
	["44"] = {
		["Coords"] = vec3(891.29,-2120.56,31.18),
		["name"] = "Bobcat",
		["type"] = "banks",
		["cooldown"] = 4320,
		["duration"] = 480,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card03",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 150000, ["max"] = 180000 }
		}
	},
	["45"] = {
		["Coords"] = vec3(252.92,228.53,102.07),
		["name"] = "Banco Central",
		["type"] = "banks",
		["cooldown"] = 7200,
		["duration"] = 580,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card05",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 480000, ["max"] = 510000 }
		}
	},
	["46"] = {
		["Coords"] = vec3(-98.69,6460.93,31.73),
		["name"] = "Banco Paleto",
		["type"] = "banks",
		["cooldown"] = 7200,
		["duration"] = 580,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card05",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 180000, ["max"] = 210000 }
		}
	},
	["47"] = {
		["Coords"] = vec3(3537.07,3669.15,28.15),
		["name"] = "Nióbio",
		["type"] = "banks",
		["cooldown"] = 7200,
		["duration"] = 580,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card05",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 280000, ["max"] = 310000 }
		}
	},
	["48"] = {
		["Coords"] = vec3(-1431.36,6756.26,12.75),
		["name"] = "Iate",
		["type"] = "banks",
		["cooldown"] = 7200,
		["duration"] = 580,
		["group"] = "Police",
		["population"] = 0,
		["avaiable"] = false,
		["timavaiable"] = 0,
		["need"] = {
			["item"] = "card05",
			["amount"] = 1
		},
		["payment"] = {
			{ ["item"] = "dollarsroll", ["min"] = 180000, ["max"] = 210000 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS:INIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("robberys:Init")
AddEventHandler("robberys:Init",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Robberys[Number] then
			if not Robberys[Number]["avaiable"] then
				if not Robberype[Robberys[Number]["type"]] then
					Robberype[Robberys[Number]["type"]] = os.time()
				end

				if os.time() >= Robberype[Robberys[Number]["type"]] then
					local Service,Total = vRP.NumPermission(Robberys[Number]["group"])
					if Total >= Robberys[Number]["population"] then
						local Consult = vRP.InventoryItemAmount(Passport,Robberys[Number]["need"]["item"])
						if Consult[1] >= Robberys[Number]["need"]["amount"] then
							if not vRP.CheckDamaged(Consult[2]) then
								if vRP.TakeItem(Passport,Consult[2],Robberys[Number]["need"]["amount"]) then
									Robberype[Robberys[Number]["type"]] = os.time() + Robberys[Number]["cooldown"]
									Robberys[Number]["timavaiable"] = os.time() + Robberys[Number]["duration"]
									Robberys[Number]["avaiable"] = true

									for Passports,Sources in pairs(Service) do
										async(function()
											TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = Robberys[Number]["name"], x = Robberys[Number]["Coords"]["x"], y = Robberys[Number]["Coords"]["y"], z = Robberys[Number]["Coords"]["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 22 })
											vRPC.PlaySound(Sources,"Beep_Green","DLC_HEIST_HACKING_SNAKE_SOUNDS")
										end)
									end

									TriggerClientEvent("Notify",source,"verde","Progresso de desencriptação do sistema iniciado, o mesmo vai estar concluído em <b>"..Robberys[Number]["duration"].."</b> segundos.","Aviso",5000)
								end
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(Robberys[Number]["need"]["item"]).."</b> danificado.","Aviso",5000)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>"..Robberys[Number]["need"]["amount"].."x "..itemName(Robberys[Number]["need"]["item"]).."</b>.","Aviso",5000)
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Contingente indisponível.","Aviso",5000)
					end
				else
					local Cooldown = parseInt(Robberype[Robberys[Number]["type"]] - os.time())
					TriggerClientEvent("Notify",source,"azul","Cofre está vazio, aguarde <b>"..Cooldown.."</b> segundos.","Aviso",5000)
				end
			else
				if os.time() >= Robberys[Number]["timavaiable"] then
					Robberys[Number]["avaiable"] = false

					for k,v in pairs(Robberys[Number]["payment"]) do
						vRP.GenerateItem(Passport,v["item"],math.random(v["min"],v["max"]),true)
					end
				else
					local Cooldown = parseInt(Robberys[Number]["timavaiable"] - os.time())
					TriggerClientEvent("Notify",source,"azul","Desencriptação em andamento, aguarde <b>"..Cooldown.."</b> segundos.","Aviso",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("robberys:Init",source,Robberys)
end)