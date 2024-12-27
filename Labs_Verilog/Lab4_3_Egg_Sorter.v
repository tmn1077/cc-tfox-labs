\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   //Egg Sorter
   //$large = $weight[7:0] >= 8'd56;
   
   //if weight larger than 64 xl(3), 56to64 lg(2) else medium(1)
   $size[1:0] = 
      $weight[7:0] >= 8'd64 
         ? 2'd3 :
      $weight[7:0] >= 8'd56 
         ? 2'd2 :
      //default
           2'd1;
   

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
