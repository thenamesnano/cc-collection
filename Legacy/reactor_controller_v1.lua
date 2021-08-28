print(os.getComputerLabel())
print("ID : "..os.getComputerID())

while true do
  local reactor = peripheral.wrap("BigReactors-Reactor_0")
  local mon = peripheral.wrap("monitor_0")
  mon.clear()
  
  -- Watermark
  mon.setCursorPos(1,1)
  mon.setBackgroundColor(colors.purple)
  mon.setTextColor(colors.black)
  mon.write("  Nano's Reactor Controller  ")
  mon.setBackgroundColor(colors.black) 
  
  -- Get Status of Reactor
  
  mon.setCursorPos(1,3)
  mon.setTextColor(colors.white)
  mon.write("Active        : ")
  mon.setTextColor(colors.lime)
  
    if reactor.getActive() == false then
      --inactive
      mon.setTextColor(colors.red)
      mon.write(reactor.getActive())
    
    elseif reactor.getActive() == true then
      --active
      mon.setTextColor(colors.lime)
      mon.write(reactor.getActive())
  
    else
      print("FATAL REACTOR ERROR")
    
    end
  
  -- Get RF/T
  
  mon.setCursorPos(1,4)
  mon.setTextColor(colors.white)
  mon.write("RF/T          : ")
  
    if reactor.getEnergyProducedLastTick() <= 10000 then
      --Low
      mon.setTextColor(colors.red)
      mon.write(math.floor(reactor.getEnergyProducedLastTick()))
      
    elseif reactor.getEnergyProducedLastTick() > 10000 then
      --Moderate
      mon.setTextColor(colors.lime)
      mon.write(math.floor(reactor.getEnergyProducedLastTick()))
    
    else
      print("FATAL REACTOR ERROR")
    
    end  
  
  -- Get RF Stored
  
  mon.setCursorPos(1,5)
  mon.setTextColor(colors.white)
  mon.write("RF Stored     : ")
  
  if reactor.getEnergyStored() <= 500000 then
    --Low
    mon.setTextColor(colors.red)
    mon.write(math.floor(reactor.getEnergyStored()))
  
  elseif reactor.getEnergyStored() <= 9980000 then
  
  if reactor.getEnergyStored() > 500000 then
    --Moderate
    mon.setTextColor(colors.lime)
    mon.write(math.floor(reactor.getEnergyStored()))
  
  end
  
  elseif reactor.getEnergyStored() >= 9980000 then
    --High
    mon.setTextColor(colors.blue)
    mon.write(math.floor(reactor.getEnergyStored()))
    
  else
    print("FATAL REACTOR ERROR")
  
  end
  
  -- Get Fuel Amount
  
  mon.setCursorPos(1,6)
  mon.setTextColor(colors.white)
  mon.write("Current Fuel  : ")
  
    if reactor.getFuelAmount() <= 12600 then
      --Low
      mon.setTextColor(colors.red)
      mon.write(math.floor(reactor.getFuelAmount()))
    
    elseif reactor.getFuelAmount() > 12600 then
      --Moderate
      mon.setTextColor(colors.lime)
      mon.write(math.floor(reactor.getFuelAmount()))
      
    elseif reactor.getFuelAmount() == 252000 then
      --Max
      mon.setTextColor(colors.blue)
      mon.write(math.floor(reactor.getFuelAmount()))
      
    else
      mon.print("FATAL REACTOR ERROR")
      
    end
  
  -- Get Fuel Capacity
  
  mon.setCursorPos(1,7)
  mon.setTextColor(colors.white)
  mon.write("Maximum Fuel  : ")
  mon.setTextColor(colors.blue)
  mon.write(math.floor(reactor.getFuelAmountMax()))
  
  -- Get Core Heat
  
  mon.setCursorPos(1,8)
  mon.setTextColor(colors.white)
  mon.write("Core Heat     : ")
  
    if reactor.getFuelTemperature() > 1000 then
      --High
      mon.setTextColor(colors.red)
      mon.write("OVERHEATING")
    
    elseif reactor.getFuelTemperature() > 200 then
    
    if reactor.getFuelTemperature() <= 1000 then
    
      --Moderate
      mon.setTextColor(colors.lime)
      mon.write(math.floor(reactor.getFuelTemperature()))
   
    elseif reactor.getFuelTemperature() <= 200 then
      --Low
      mon.setTextColor(colors.blue)
      mon.write(math.floor(reactor.getFuelTemperature()))
      
    else
      print("FATAL REACTOR ERROR")
      
    end
    end
    
  -- Get Casing Heat
  
  mon.setCursorPos(1,9)
  mon.setTextColor(colors.white)
  mon.write("Casing Heat   : ")
  
    if reactor.getCasingTemperature() > 1000 then
      --High
      mon.setTextColor(colors.red)
      mon.write("OVERHEATING")
      
    elseif reactor.getCasingTemperature() > 200 then
    
      if reactor.getCasingTemperature() <= 1000 then
      
      --Moderate
      mon.setTextColor(colors.lime)
      mon.write(math.floor(reactor.getCasingTemperature()))
      
    elseif reactor.getCasingTemperature() <= 200 then
      --Low
      mon.setTextColor(colors.blue)
      mon.write(math.floor(reactor.getCasingTemperature()))
      
    else
      write("FATAL REACTOR ERROR")
      
    end
    end
  
  -- Time Before Update
  
  sleep(5)
      
end
