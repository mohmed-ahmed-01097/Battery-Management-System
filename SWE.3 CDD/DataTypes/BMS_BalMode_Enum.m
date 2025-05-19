classdef BMS_BalMode_Enum < Simulink.IntEnumType
  enumeration
    BMS_Active(0)
    BMS_Passive(1)
  end
  methods (Static)
    function retVal = getDefaultValue()
      retVal = BMS_BalMode_Enum.BMS_Active;
    end
  end
end 