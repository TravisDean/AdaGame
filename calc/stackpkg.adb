with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body StackPkg is
    function isEmpty (s : Stack) return Boolean is
    begin
        return s.Top = 0;
    end isEmpty;

    function isFull  (s : Stack) return Boolean is
    begin
        return s.Top = Size;
    end isFull;

    procedure push (item : ItemType; s : in out Stack) is
    begin
        s.Top := s.Top + 1;
        s.Elements(s.Top) := item;
    end push;

    procedure pop  (s : in out Stack) is
    begin
        if s.top = 0 then raise Stack_Empty; end if;
        s.top := s.Top -1;
    end pop;

    function  top   (s : Stack) return ItemType is
    begin
        if s.top = 0 then raise Stack_Empty; end if;
        return s.Elements(s.Top);
    end top;

end StackPkg;



