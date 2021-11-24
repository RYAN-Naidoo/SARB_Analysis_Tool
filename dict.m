classdef dict
   properties
      bankNames = ["Capitec" "Investec" "ABSA" "FNB" "Standard_Bank" "Nedbank"  "TOTAL"];
      bankCodes = [333107 25054 34118 416053 416061 416088 111111];
   end

   methods    

       % Function to get code corresponding to name     
       function bankCode = getBankCode(obj,bankName)
          codeIndex = find(strcmp(obj.bankNames,bankName));
          bankCode = obj.bankCodes(codeIndex);
       end

       % Function to get name corresponding to code 
       function bankName = getBankName(obj,bankCode)
           index = find(obj.bankCodes,bankCode);
           bankName = obj.bankNames(index);
       end

   end   % end methods 
end % end class 