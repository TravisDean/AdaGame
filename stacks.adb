--stacks.adb
--code from abstract stack as in notes, may need to be edited
package body Stacks is

    function IsEmpty (S : Stack) return Boolean is
    begin
        return S.Top = 0;
    end IsEmpty;

    ...

    procedure Push (Item : ItemType; S : in out Stack) is
    begin
        if IsFull (S) then
            raise Stack_Full;
        else
            S.Top := S.Top + 1;
            S.Elements(S.Top) := Item;
        end if;
    end Push;

    ...

end StackPkg;
