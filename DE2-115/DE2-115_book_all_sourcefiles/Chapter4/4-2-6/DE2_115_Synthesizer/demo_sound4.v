module demo_sound4(
        input clock,
        output [7:0]key_code,
        input k_tr
    );



    reg   [15:0]  tmp;
    wire  [15:0]  tmpa;
    reg           tr;
    reg   [15:0]  step;
    wire  [15:0]  step_r;
    reg    [7:0]  TT;
    reg    [5:0]  st;
    reg           go_end;

    always @(negedge k_tr or posedge clock)
    begin
        if (!k_tr)
        begin
            step=0;
            st=0;
            tr=0;
        end
        else
            if (step<step_r)
            begin
                case (st)
                    0:
                        st=st+1;
                    1:
                    begin
                        tr=0;
                        st=st+1;
                    end
                    2:
                    begin
                        tr=1;
                        st=st+1;
                    end
                    3:
                        if(go_end)
                            st=st+1;
                    4:
                    begin
                        st=0;
                        step=step+1;
                    end
                endcase
            end
    end

    ///////////////////////////////////////////
    wire  [7:0]key_code1=(
              (TT[3:0]==1)?8'h2b:(//1
                  (TT[3:0]==2)?8'h34:(//2
                      (TT[3:0]==3)?8'h33:(//3
                          (TT[3:0]==4)?8'h3b:(//4
                              (TT[3:0]==5)?8'h42:(//5
                                  (TT[3:0]==6)?8'h4b:(//6
                                      (TT[3:0]==7)?8'h4c:(//7
                                          (TT[3:0]==10)?8'h52:(//1
                                              (TT[3:0]==15)?8'hf0:8'hf0//OFF
                                          ))))))))
          );

    assign key_code=(tmp<(tmpa-1))?key_code1:8'hf0;

    assign tmpa[15:0]=(
               (TT[7:4]==15)?16'h10:(
                   (TT[7:4]==8)? 16'h20:(
                       (TT[7:4]==9)? 16'h30:(
                           (TT[7:4]==1)? 16'h40:(
                               (TT[7:4]==3)? 16'h60:(
                                   (TT[7:4]==2)? 16'h80:(
                                       (TT[7:4]==4)? 16'h100:(
                                           (TT[7:4]==5)? 16'hc0:0

                                       )))))))
           );


    always @(negedge tr or posedge clock)
    begin
        if(!tr)
        begin
            tmp=0;
            go_end=0 ;
        end
        else if (tmp>tmpa)
            go_end=1;
        else
            tmp=tmp+1;
    end


    always @(step)
    begin
        case (step)
            0:
                TT=8'h11;
            1:
                TT=8'h91;
            2:
                TT=8'hf1;
            3:
                TT=8'h31;
            4:
                TT=8'h84;
            5:
                TT=8'h15;
            6:
                TT=8'h15;
            7:
                TT=8'h31;
            8:
                TT=8'h83;
            9:
                TT=8'h34;
            10:
                TT=8'h84;
            11:
                TT=8'h35;
            12:
                TT=8'h85;
            13:
                TT=8'h31;
            14:
                TT=8'h81;
            15:
                TT=8'h11;
            16:
                TT=8'h11;
            17:
                TT=8'h31;
            18:
                TT=8'h81;
            19:
                TT=8'h11;
            20:
                TT=8'h11;
            21:
                TT=8'h11;
            22:
                TT=8'h31;
            23:
                TT=8'h1f;
            24:
                TT=8'h1f;
            25:
                TT=8'h81;
            26:
                TT=8'h81;
            27:
                TT=8'h81;
            28:
                TT=8'h81;
            29:
                TT=8'h81;
            30:
                TT=8'h35;
            31:
                TT=8'h85;
            32:
                TT=8'h85;
            33:
                TT=8'h85;
            34:
                TT=8'h85;
            35:
                TT=8'h85;
            36:
                TT=8'h31;
            37:
                TT=8'h81;
            38:
                TT=8'h31;
            39:
                TT=8'h84;
            40:
                TT=8'h15;
            41:
                TT=8'h15;
            42:
                TT=8'h21;
            43:
                TT=8'h1f;
        endcase
    end

    assign step_r=43;

endmodule

