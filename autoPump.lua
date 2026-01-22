local config = require('config')
local component = require('component')
local sides = require('sides')
local robot = require('robot')
local me = component.upgrade_me
local inv = component.inventory_controller
local r = component.redstone
local master = {}

-- ===================== FUNCTIONS ======================
local function mapCards()
	for i=1, robot.inventorySize() + 1 do
		local card = inv.getStackInInternalSlot(i)

		-- Update card slot, add to master
		if card ~= nil then
			if config[card.label] then
				config[card.label].slot = i
				master[card.label] = config[card.label]
			else
				print(string.format("ERROR: Card '%s' in slot %d is not in config.lua!", card.label, i))
			end
		else
			break
		end
	end
end

local function updateFluids()
    print('Updating all fluids...')
    for _, fluid in pairs(master) do
        fluid.amount = -1
    end

    for _, fluid in ipairs(me.getFluidsInNetwork()) do
        if master[fluid.label] ~= nil then
            master[fluid.label].amount = fluid.amount
        else
            print("WARNING: Mismatch: ME has '" .. fluid.label .. "', but no matching Config.")
        end
    end

    for label, fluid in pairs(master) do
        if fluid.amount == -1 then
            master[label] = nil
        end
    end
end

local function selectFluid()
	local lowest = nil
	local lowestPercent = 1

	-- Iterate over the known cards
	for label, fluid in pairs(master) do
		local percent = fluid.amount / fluid.target
		if percent < lowestPercent then
			lowest = label
			lowestPercent = percent
		end
	end
	return lowest
end

local function calcDuration(fluid)
    local duration = 1.05 * (master[fluid].target - master[fluid].amount) / (master[fluid].rate * config.mult)
    return math.min(300, duration)
end

local function waitStopPump()
    local timeout = 2
    r.setOutput(sides.front, 0)

    print(string.format('autoPump: Waiting for %d seconds for pump to stop...', timeout))
    os.sleep(2)
end

local function setFluid(fluid, duration)
	-- Use appropriate card
	local cardindex = master[fluid].slot
	local card = inv.getStackInInternalSlot(cardindex)
	print(string.format('autoPump: Selecting card: %s', card.label))
  	print(string.format('autoPump: Switching to %s for %.0f seconds', fluid, duration))
  	print()
	robot.select(cardindex)
	inv.equip()
	robot.use()
	inv.equip()
  
	r.setOutput(sides.front, 15)

	-- Wait set duration
	os.sleep(duration)
end

-- ======================== MAIN ========================
local function main()
	-- Start by shutting off the pump, so the robot can do its work.
	waitStopPump()
	
	print('autoPump: Mapping Cards')
	mapCards()

	-- THE LOOP
	while true do

		-- Determine lowest fluid (% of target)
		updateFluids()
		fluid = selectFluid()

		-- Set pump settings
		if fluid ~= nil then
			duration = calcDuration(fluid)
			setFluid(fluid, duration)
		else
			-- All targets reached, sleep for 3 minutes
			print('autoPump: Standing by...')
			os.sleep(180)
		end

		-- Pause to change fluid
		waitStopPump()
  end
end

main()
