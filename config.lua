local config = {

  -- Pumping Module Tier
  tier=1,

  -- ONLY CHANGE THE "TARGET" VALUES, NOT THE AMOUNTS OR RATES
  -- (Targets set to 0 are disabled/not in your current priority list)

  -- Planet 2 ============================================================
  ['Chlorobenzene'] =      {target=1e10,   amount=0,  rate=896000},

  -- Planet 3 ============================================================
  ['Ender Goo'] =          {target=1e10,   amount=0,  rate=32000}, 
  ['Very Heavy Oil'] =     {target=1e10,   amount=0,  rate=1400000},
  ['Lava'] =               {target=1e10,   amount=0,  rate=1800000},
  ['Natural Gas'] =        {target=1e10,   amount=0,  rate=1400000},

  -- Planet 4 ============================================================
  ['Sulfuric Acid'] =      {target=1e10,   amount=0,  rate=784000},
  ['Molten Iron'] =        {target=1e10,   amount=0,  rate=896000},
  ['Oil'] =                {target=1e10,   amount=0,  rate=1400000},
  ['Heavy Oil'] =          {target=1e10,   amount=0,  rate=1792000},
  ['Molten Lead'] =        {target=1e10,   amount=0,  rate=896000},
  ['Raw Oil'] =            {target=1e10,   amount=0,  rate=1400000},
  ['Light Oil'] =          {target=1e10,   amount=0,  rate=780000},
  ['CO2 Gas'] =            {target=1e10,   amount=0,  rate=1680000},

  -- Planet 5 ============================================================
  ['Carbon Monoxide'] =    {target=1e10,   amount=0,  rate=4480000},
  ['Helium-3'] =           {target=1e10,   amount=0,  rate=2800000},
  ['Salt Water'] =         {target=1e10,   amount=0,  rate=2800000},
  ['Helium Gas'] =         {target=1e10,   amount=0,  rate=1400000},
  ['Liquid Oxygen'] =      {target=1e10,   amount=0,  rate=896000},
  ['Neon'] =               {target=1e10,   amount=0,  rate=32000},
  ['Argon Gas'] =          {target=1e10,   amount=0,  rate=32000},
  ['Krypton'] =            {target=1e10,   amount=0,  rate=8000},
  ['Methane Gas'] =        {target=1e10,   amount=0,  rate=1792000},
  ['Hydrogen Sulfide'] =   {target=1e10,   amount=0,  rate=392000},
  ['Ethane'] =             {target=1e10,   amount=0,  rate=1194000},

  -- Planet 6 ============================================================
  ['Deuterium'] =          {target=1e10,   amount=0,  rate=1568000},
  ['Tritium'] =            {target=1e10,   amount=0,  rate=240000},
  ['Ammonia'] =            {target=1e10,   amount=0,  rate=240000},
  ['Xenon'] =              {target=1e10,   amount=0,  rate=16000},
  ['Ethylene'] =           {target=1e10,   amount=0,  rate=1792000},

  -- Planet 7 ============================================================
  ['Hydrofluoric Acid'] =  {target=1e10,   amount=0,  rate=672000},
  ['Fluorine'] =           {target=1e10,   amount=0,  rate=1792000},
  ['Nitrogen Gas'] =       {target=1e10,   amount=0,  rate=1792000},
  ['Oxygen Gas'] =         {target=1e10,   amount=0,  rate=1729000},

  -- Planet 8 ============================================================
  ['Hydrogen Gas'] =       {target=1e10,   amount=0,  rate=1568000},
  ['Liquid Air'] =         {target=1e10,   amount=0,  rate=875000},
  ['Molten Copper'] =      {target=1e10,   amount=0,  rate=672000},
  ['Unknown Liquid'] =     {target=1e10,   amount=0,  rate=672000},
  ['Distilled Water'] =    {target=1e10,   amount=0,  rate=17920000},
  ['Radon'] =              {target=1e10,   amount=0,  rate=64000},
  ['Molten Tin'] =         {target=1e10,   amount=0,  rate=672000}
}

config.mult = 4 ^ (2 ^ (config.tier-1))
return config
