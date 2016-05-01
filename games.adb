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
        pName = su.trim(pName);
        return Person(pName, pSkill, pAge, index => currIndex);
    end getPerson;

    procedure getPlayers is
        index : Integer := 0;
    begin
        loop
           exit when end_of_file;
            enqueue(zeroLoss, getPerson(  

begin
    function getInput(
    zeroLoss := getInput();


 
procedure games is
--use queue for the print output (winner on top, followed by most recently eliminated)
--Use stack for the 3 stacks that have no losses, 1 loss, 2 losses (eliminated)
    --

    

Begin








end games;
