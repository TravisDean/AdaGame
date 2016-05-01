with Ada.Text_IO; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io; 
with ada.characters.handling; use  ada.characters.handling;
with BigNumPkg; use BigNumPkg;
with StackPkg;

procedure RPN is
    package BigNum_StkPkg is new StackPkg(Size => 100, ItemType => BigNum);
    use BigNum_StkPkg;
    stk: Stack;

    v: BigNum;
    x, y: BigNum;
    c: character;
    eol: boolean;
begin
    loop
        exit when end_of_file;
        look_ahead(c, eol);

        if eol then
            skip_line;
        else
            if c = ' ' then
                Ada.Text_IO.get(c);

            elsif is_digit(c) then
                get(v);
                push(v, stk);

            elsif c = '+' or c = '*' then
                Y := top (stk) ; pop (stk);
                X := top (stk) ; pop (stk);
                if c = '+' then 
                    push((x+y), stk);
                else
                    push((x*y), stk);
                end if;
                Ada.Text_IO.get(c);     -- Make sure to eat the op afterwards 

            elsif c = 'p' then
                Ada.Text_IO.get(c);     
                put(top(stk),0);
                new_line;
            elsif c = 'P' then
                Ada.Text_IO.get(c);     
                pop(stk);
            elsif c = 'q' then
                exit ;

            else 
                Ada.Text_IO.get(c);
            end if;
        end if;

    end loop;
end rpn;
