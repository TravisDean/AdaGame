--123456667898767839393939393939399999999999999999999999999999999999
--games.adb
-- Games.adb is a program that simulates a dual elimination game, it takes 
-- in information about each player, their name, skill, and age. It matches
-- the players up and by score it determines whether the person wins or
-- loses the game. After 2 losses the person is eliminated from the game.
--with Ada.Text_IO; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io; 
with Ada.Strings.Unbounded; 
with Stacks;
with Queues;
procedure playGame is
    package SU renames Ada.Strings.Unbounded;
    type Person is
        record
            name : su.Unbounded_string;
            skill : Integer;
            age : Integer;
            wins : Integer := 0;
            losses : Integer := 0;
            index : Integer;
        end record;

    package PersonStack is new Stacks(ItemType => Person); 
    use PersonStack;
    package PersonQueue is new Queues(ItemType => Person);
    use PersonQueue;
    zeroLoss : PersonQueue;
    oneLoss : PersonQueue;
    done : PersonStack;

    function getPerson(currIndex : Integer) return PersonQueue is
        p : Person;
        pName : su.Unbounded_string;
        pSkill : Integer;
        pAge : Integer;
    begin
        get_line(pName);
        get(pSkill);
        get(pAge);
        pName := su.trim(pName);
        return Person(pName, pSkill, pAge, index => currIndex);
    end getPerson;

    -- first by skill, then age, then index
    function "<" (Left, Right : Person) return Boolean is
    begin
        if left.skill /= right.skill then
            return left.skill < right.skill;
        elsif left.age /= right.age then
            return left.age < right.age;
        else
            return left.index < right.index
        end if;
    end "<";

    procedure playMatch(p1: in out Person; p2: in out Person) is
    begin
        if p1 < p2 then
            p1.losses := p1.losses + 1;
            p2.wins := p2.wins + 1;
        else
            p2.losses := p2.losses + 1;
            p1.wins := p1.wins + 1;
        end if;
    end playMatch;

    function getPlayers return Integer is
        index : Integer := 0;
    begin
        loop
            exit when end_of_file;
            index := index + 1;
            enqueue(getPerson(index), zeroLoss);
        end loop;
        return index;
    end getPlayers;

    procedure gameloop is
        numPlayers : Integer;
        best : Person;
    begin
        numPlayers := getPlayers();
        if numPlayers = 0 then
            exit;
        elsif numPlayers = 1 then
            print(front(zeroLoss));     -- Need to def print
            exit;
        end if;

        while not is_Empty(zeroLoss) loop
            -- Normal case: get two, check match, enqueue
           p1 := front(zeroLoss); dequeue(zeroLoss);
           -- Handle odd and even amounts
           if not is_Empty(zeroLoss) then
               p2 := front(zeroLoss); dequeue(zeroLoss);
               playMatch(p1, p2);   -- Modifying func
               if p1.losses = 0 then
                   enqueue(p1, zeroLoss);
                   enqueue(p2, oneLoss);
               elsif
                   enqueue(p2, zeroLoss);
                   enqueue(p1, oneLoss);
               end if;
            -- The odd num left case
            else then
                best := p1; 
           end if;
        end loop;

        while not is_Empty(oneLoss) loop
            -- Normal case: get two, check match, enqueue
           p1 := front(oneLoss); dequeue(oneLoss);
           -- Handle odd and even amounts
           if not is_Empty(oneLoss) then
               p2 := front(oneLoss); dequeue(oneLoss);
               playMatch(p1, p2);   -- Modifying func
               if p1.losses = 1 then
                   enqueue(p1, oneLoss);
                   push(p2, done);
               elsif
                   enqueue(p2, oneLoss);
                   push(p1, done);
               end if;
            -- The odd num left case
            else then   -- so p1 must face our best for the title
               playMatch(best, p1);
               if best.losses = 0 then
                   push(p1, done);
                   push(best, done);
               elsif            -- All this double push/enq stuff could be 
                                -- simplified with pointers
                   push(best, done);
                   push(p1, done);
               end if;
           end if;
        end loop;

        -- So now we have to print off the results
        while not is_Empty(done) loop
            print(top(done));
            pop(done);
        end loop;
begin


 
procedure games is
--use queue for the print output (winner on top, followed by most recently eliminated)
--Use stack for the 3 stacks that have no losses, 1 loss, 2 losses (eliminated)
    --

    

Begin








end games;
