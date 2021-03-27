%Yahtzee implementation in SWI-Prolog
%https://en.wikipedia.org/wiki/Yahtzee#Rules
%
%Usage examples:
%banshee([3,4,1,1,4], Result).
%Will give you list(Result) of possible scorings, duplicates removed
%
%banshee([3, 4, 5, 1, 1], What, Points).
%Will give you all possible scorings(What) and corresponding
%points(Points)

banshee(Dies, Result):-
    setof((What, Points), banshee(Dies, What, Points), Result).

banshee(Dies, ones, Points):-
    length(Dies, 5),
    include(equals_number(one), Dies, OneDies),
    sum_list(OneDies, Points),
    Points > 0.

banshee(Dies, twos, Points):-
    length(Dies, 5),
    include(equals_number(two), Dies, TwoDies),
    sum_list(TwoDies, Points),
    Points > 0.

banshee(Dies, threes, Points):-
    length(Dies, 5),
    include(equals_number(three), Dies, ThreeDies),
    sum_list(ThreeDies, Points),
    Points > 0.

banshee(Dies, fours, Points):-
    length(Dies, 5),
    include(equals_number(four), Dies, FourDies),
    sum_list(FourDies, Points),
    Points > 0.

banshee(Dies, fives, Points):-
    length(Dies, 5),
    include(equals_number(five), Dies, FiveDies),
    sum_list(FiveDies, Points),
    Points > 0.

banshee(Dies, sixes, Points):-
    length(Dies, 5),
    include(equals_number(six), Dies, SixDies),
    sum_list(SixDies, Points),
    Points > 0.

banshee(Dies, three_of_a_kind, Points):-
    once((
        length(Dies, 5),
        permutation(Dies, [D1, D1, D1, _, _]),
        sum_list(Dies, Points)
    )).

banshee(Dies, four_of_a_kind, Points):-
    length(Dies, 5),
    permutation(Dies, [D1, D1, D1, D1, _]),
    sum_list(Dies, Points).

banshee(Dies, fullhouse, 25):-
    length(Dies, 5),
    permutation(Dies, [D1, D1, D2, D2, D2]),
    D1 \= D2.

banshee(Dies, small_straight, 30):-
    length(Dies, 5),
    permutation(Dies, [1, 2, 3, 4, _]).

banshee(Dies, small_straight, 30):-
    length(Dies, 5),
    permutation(Dies, [2, 3, 4, 5, _]).

banshee(Dies, small_straight, 30):-
    length(Dies, 5),
    permutation(Dies, [3, 4, 5, 6, _]).

banshee(Dies, large_straight, 40):-
    length(Dies, 5),
    permutation(Dies, [1, 2, 3, 4, 5]).

banshee(Dies, large_straight, 40):-
    length(Dies, 5),
    permutation(Dies, [2, 3, 4, 5, 6]).

banshee(Dies, yahtzee, 50):-
    length(Dies, 5),
    permutation(Dies, [D1, D1, D1, D1, D1]).

banshee(Dies, change, Points):-
    length(Dies, 5),
    sum_list(Dies, Points).

%Needed for first six rules(ones, twos etc)
equals_number(one, Number):-
    Number =:= 1.

equals_number(two, Number):-
    Number =:= 2.

equals_number(three, Number):-
    Number =:= 3.

equals_number(four, Number):-
    Number =:= 4.

equals_number(five, Number):-
    Number =:= 5.

equals_number(six, Number):-
    Number =:= 6.
