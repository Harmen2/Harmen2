%sum [] 6.
sum([], 0).
sum([Head | Tail], Result):- 
sum(Tail, S),
Result is Head + S.

%elephant is bigger the a horse.
bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).
%transitivty
is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).

%de :- betekend if 
class(7).
pogg() :- class(7).
% de , betekend and
flass(8).
pogger() :- class(7), flass(8).

% is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).
% lets try to vind a Z, for which we have the bigger relation,
% and that is treu, because we can go from the elepahnt to the horse,
% so then our horse will be the next step, which gives is_bigger(horse, monkey)
% then is_bigger(donkey, monkey) and that returns treu 
% the is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y). function is difining itself
% and using itself, this is called recursion

% querry 1: is_bigger(elephant, monkey).
% querry 2: is_bigger(elephant, X).

% is_bigger(elephant, X). If X = horse, its treu  

% querry 3: is_bigger(donkey, X), is_bigger(X, monkey), dit is als vraag,
% is er een variablee X die voor bijde gevallen geldt. 
% querry 4: is_bigger(donkey, X), is_bigger(Y, monkey).
% geeft gwn waardes voor x en y. 
s