# Banshee is Yahtzee implementation in SWI-Prolog
https://en.wikipedia.org/wiki/Yahtzee#Rules

Usage examples:
banshee([3,4,1,1,4], Result).
Will give you list(Result) of possible scorings, duplicates removed

banshee([3, 4, 5, 1, 1], What, Points).
Will give you all possible scorings(What) and corresponding
points(Points)

