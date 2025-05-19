classdef BMS_State_Enum < Simulink.IntEnumType
  enumeration
    BMS_Standby(0)
    BMS_Charging(1)
    BMS_Driving(2)
    BMS_Balancing(3)
    BMS_Fault(4)
    BMS_FaultReset(5)
  end
  methods (Static)
    function retVal = getDefaultValue()
      retVal = BMS_State_Enum.BMS_Standby;
    end
  end
end 