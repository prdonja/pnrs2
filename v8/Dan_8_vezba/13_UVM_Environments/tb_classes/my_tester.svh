/*
   Copyright 2013 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
class my_tester extends base_tester;
   `uvm_component_utils (my_tester)
   
   function byte get_data();
      bit [1:0] zero_ones;
      zero_ones = $random;
      if (zero_ones == 2'b00)
        return 8'h00;
      else if (zero_ones == 2'b11)
        return 8'hFF;
      else
        return $random;
   endfunction : get_data

   function operation_t get_op();
      return new_op;
   endfunction : get_op

   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

endclass : my_tester






