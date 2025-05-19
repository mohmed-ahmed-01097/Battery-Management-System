classdef BMS_Conector_Enum < Simulink.IntEnumType
  enumeration
    CNT_Init(0)
    CNT_Close(1)
    CNT_Open(2)
  end
  methods (Static)
    function retVal = getDefaultValue()
      retVal = BMS_Conector_Enum.CNT_Init;
    end
  end
end 