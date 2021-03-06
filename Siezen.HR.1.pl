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
%dit is blijkbaar recursie
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

cute(X) :- cat(X), cute(X).
cat(luna).

brother(X, Y) :- 
    male(X),
    parent(Z, Y),
    parent(Z, X),
    X \= Y.

% X = [a| [b| [c| []]]]. = 
% X = [a, b, c].

% first predicate usning lists
%concat_lists([1, 2, 3, 4], [dog, cow, tiger], L).
% concat_lists(X, Y, Z) :- concat_lists([X | Y]) = concat_lists(Z). Nee deze is fout
% Base case of 'concat_list/3'
concat_lists([], List, List).

% in the recursive step we remove the head and call the predicate on the shorter tail

% Recursive step of 'concat_lists/3'
concat_lists([Elem|List1], List2, [Elem|List3]) :- concat_lists(List1, List2, List3).
% twee problem. Elem wordt van beide hoofden afgehaald, dus Elem wordt van L en van [1,2,3] afgehaald 
% om vervolgens met de rest ervandoor te gaan

% dus hij gaat terug naar de base case, waarbij list2 en list 3 hetzelfde worden, nadat alle elementen 
% gestript zijn uit list 1. En vervolgens wordt list 1, samen met list 3 weer in elkaar gezet. Waarbij 
% alle elementen uit list 1, bovenop de al bestaande lijst 2 in lijst 3 opgegooid worden. als het warde 
% in omgekeerde volgorde 
testrecursie([], []).
testrecursie([A|B], [A|C]) :- testrecursie(B, C).

% Dit is volgens mij nog een manier om een lijst te reversen
inreverse([],[_]).
inreverse([H|T], Result) :- Newresult = [Result|H], inreverse(T, Newresult).
%volgens mij zijn er meerdere redenen waarom dit niet werkt,
%eerste omdat het hoofd altijd een element moet zijn, ookal is de lijst leeg,want [ | [2]] kan niet.
% daarnaast ook dat die base case niet werkt. 
% de reden dant ik dacht dat dit werkte, was dat ik dacht dat hij [1|H] telkens bij de tail toevoegd.
% waardoor hij op die manier een van begin naar groot kan maken.  
% [NewResult|H] = Result. 
% werkt niet, want we gebruiken de head altijd om nieuwe elmenten toe te voegen, en niet de tail. 

% [NewResult|H] = Result. ???what where doing here is we have H, which is the atom that we want to 
% include, and what we then need/want to say, the NewResult is a list of atoms, and we want to 
% combine that but what we want is that H is used as an item and NewResult is used as a list and 
% if you remember the bar syntax, it works the other way around( so [ Head = is used as an item, 
% and | Tail = used as a list]"  

% Base case doesnt contain any atoms
atomsx([],[]).
atomsx([X|Tail], Result) :- atom(X), atomsx(Tail, [X|Result]). %Maar, "een lijst met 1 element, zal 
% altijd het hoofd zijn, Dus zou je dan niet voor altijd de hoofd verandere?"
atomsx([_|Tail], Result) :- atomsx(Tail, Result).
%Dit is dus blijkbaar ook fout, want met recursie werkt dat niet zo.
atoms([],[]).
atoms([X|Tail],[X|Result]) :- atom(X),!, atoms(Tail, Result).
atoms([_|Tail], Result) :- atoms(Tail, Result).
% ik denk dat dit zo werkt met prolog, met dat hij zecht, dat je eerst het probleem moet definen, (de querry)
% En daarna een manier te vinden, hoe je dat gaat doen, na de :-.


%[Result|H] = NewResult, hierbij zeg je, dat NewResult moet matchen met [Result | H]
 
len([], 0).
len([_ | Gist], Lenn2) :- len(Gist, Lenn), Lenn2 is Lenn  + 1. 


recursion([_|Tails], Lengtetail) :- recursion(Tails, LengteTailkort), Lengtetail is LengteTailkort + 1.
% want hij heeft de vragen al telkens gesteld, dus als hij antwoord krijgt op de meest diepe vraag,
% de vraag voor de base case, dan zal hij vantuit die diepte telkens weer naar boven werken.
% hierdoor is recursion(Tails, LengteTailkort) = recursion([]], 0) waardoor hij door kan gaan na de comma
% wat geeft Lengtetail is 0 + 1., en daardoor kan hij antwoord geven op de vraag daar boven die
% al gesteld was, dus dan heb je recursion([a], 1), na de comma Lengtetail is 1 + 1. Want recursion(Tails, LengteTailkort)
% vraagt het telkens aans aan recursion([_|Tails], Lengtetail), en als die vraag beantwoord is, dan heb je een
% waarde voor Lengtetail, wat op de plek komt van LengteTailkort. En de lengte van de lijst die wordt 
% gehouden op Tails. Want je stelt de vraag met die waarde.

% op(400, xfx, bigger). % infix(want midden), non-associative(want () maken niet uit) 
:- op(400, xfx, is_bigger).
:- print("Hello Harman").
% :- consult('library.pl')  for including other files.
% :- op(200, fy, small) gives enable to small(elephant) = small elephant
% " it might be better to use fx instead of fy because now you can nest it"
% like small small elepahnt" but thats a matter of semantics
subist([],_).
subist([X|Sub], List) :- select(X, List, Minlist), subist(Sub, Minlist). 

line(0, _) :- !.
line(Dots, Symbol) :- print(Symbol), Dots2 is Dots - 1, line(Dots2, Symbol).


draw(Begin, Eind) :- line(Begin, *), 
Begin2 is Begin + 1, 
nl,
Eind >= Begin2, 
draw(Begin2, Eind). 
draw(Eind, Eind).

triangle(C) :- draw(0, C).
:- op(200, fy, small).
% there is no yfy pattern, because y is the place where its the same precedence or lower. 
% if both sides of f held a operator with the same precedence as f, then prolog wouldt know 
% which one comes first, so thats why there has to be an x, or just fy.

:- op(300, fy, bli).
:- op(450, xfy, bla).
:- op(500, yf, blu).
% rechts ervan moet altijd equal of strictly less zijn, maar dan moet bla, lager of gelijk zijn aan blibli, en bli moet lager of gelijk zijn aan blu
% dus bli moet lager of gelijk zijn aan blibli, 
% blu moet lager of gelijk zijn aan bli
% blu moet lager zijn dan bli bli 
% blibli moet lager of gelijk zijn aan bli. Dus ze moeten hetzelfde zijn
:- op(100, yfx, plink),
op(200, xfy, plonk).

% ?- tiger plink dog plink fish = X plink Y.
% everything on the left of plink, has a lower precedence, so its
% ((tiger) plink dog) plink fish, which means that tiger plink dog, are grouped
% in paranthesis because they come first, becayse of xfy pattern

% ?- cow plonk elephant plink bird = X plink Y.
% (cow plonk elephant) plink bird
% this gails because plonk gives elephant an max precedence of 200, while
% plink says elephant needs to have atleast 100 precedence

% ?- X = (lion plink tiger) plonk (horse plink donkey).
% because they are in paranthesis, they come first, 
% and because horse and lion can have higher paranthesis then
% donket and tiger, they come first as well
% the operators all have lower precedence then plonk, so the () disaapear.

% Question: Does xfy, does it "give values?" to the things on the left and right?
% so 
%:- op(100, yfx, ca).% and
%:- op(200, xfy, cb).%  means that
% they cannot be next to eachother because they arent 1 way 
% and arent the same value and because of the patterns,
% I think 
:- op(100, yfx, ca).% and
% 
:- op(100, xfy, cb).%  would work with a cb ca b 

% 3 ?- a cb l ca b = X cb Y.  
%false. waarom faalt dit? Heeft met de "principle operator" temaken
permutation([],[]).
permutation(List, [Head|Permuation]):-
select(Head, List, Rest),
permutation(Rest, Permuation). % special recursion, it gives the answers like previous, but in the end.
% every call of permutation adds one to it. 

%add(_, [], _).
%add(Item, [Head|Listed], X) :- \+ Item = Head, add(Item, Listed, X), X = [Item, Head|Listed].
%add(_, List1, List2) :- List2 = List1. 

add(Elem, List, Result) :- member(Elem, List),!, Result = List.

add(Elem, List, [Elem | List]). 

product([],1).
product([H|Tail], Result) :-
integer(H),
product(Tail, TailProduct),
!,
Result is H * TailProduct.
product([_|Tail], Result) :- 
product(Tail, Result).
% principle operator is volgens mij, de gene met laagste precedence?
:- op(100, yfx, doom).
:- op(99, xfy, fist).
%het geeft false wanner de priority niet duidelijk is. 

:- op(100, yfx, plink),
op(200, xfy, plonk).
% ?- tiger plink dog plink fish = X plink Y.
% ?- cow plonk elephant plink bird = X plink Y.
% ?- X = (lion plink tiger) plonk (horse plink donkey).
% ?- kat doom mouse doom italian fist spouse = kat doom (mouse doom (italian fist) spouse). ???
student(ann, 44711, passed).
student(bob, 50815, passed).
student(pat, 41018, failed).
student(sue, 41704, passed).
%?- Goal = (student(Name, ID, Grade), ID < 50000), findall(Name/Grade, Goal, List).
check(Rel, A, B) :- 
    Goal =.. [Rel, A, B],
    call(Goal).
swap(Rel, [A,B|List], [B, A | List]) :- 
    check(Rel, B, A). %wanneer B groter is dan A, Swap ze.
swap(Rel, [A|List], [A|NewList]) :-
    swap(Rel, List, NewList). 
% Deze recursie is best lastig om te volgen
swap2(Rel, [A,B|List], [B|NewList]) :-
    check(Rel, B, A),
    swap2(Rel, [A|List], NewList). 
swap2(Rel, [A|List], [A|NewList]) :-
    swap2(Rel, List, NewList).
% Deze recurise is ook best lastig om te volgen 
swap2(_, [], []). 
bubblesort(Rel, List, SortedList) :-
    swap(Rel, List, NewList),
    !,
    bubblesort(Rel, NewList, SortedList).
bubblesort(_, SortedList, SortedList).
bubblesort2(Rel, List, SortedList):- 
    swap2(Rel, List, NewList), % always succeeds, want hij gaat sowieso door de heele lijst heen, of er nou wel of niet iets veranderd
    List \= NewList, %check that there was a swap 
    !,
    bubblesort2(Rel, NewList, SortedList).
bubblesort2(_, SortedList, SortedList). 

%Base case: the empty list is sorted
quicksort(_, [], []). 
/* Recursive call: remove the' ' from the
* unsorted list and split the 'Tail" into elements
* 'left' and 'right' of the pivot using 'rel' */  
quicksort(Rel,[Head|Tail], SortedList) :-
    split(Rel, Head, Tail, Left, Right), % splitting, not yet defined 
    quicksort(Rel, Left, SortedLeft), % sort'left'
    quicksort(Rel, Right, SortedRight), % sort right
    append(sortedLeft, [Head|SortedRight], SortedList).
%Base case: empty list split into two empty lists 
split(_, _, [], [], []). 

% if Head is smaller than Middle, include it in LEft 
split(Rel, Middle, [Head|Tail], [Head | Left], Right) :- 
check(Rel, Head, Middle), 
!,
split(Rel, Middle, Tail, Left, Right).

% otherwise, include Head in Right  
split(Rel, Middle, [Head|Tail], Left, [Head|Right]) :- 
    split(Rel, Middle, Tail, Left, Right). % hoe gaat met met e
move(Stacks, NewStacks) :-
    select([Top|Stacks1], Stacks, Rest),
    select(Stack2, Rest, Otherstacks),
    NewStacks = [Stack1, [Top|Stack2]|Otherstacks].
goal(Stacks) :- member([a,b,c], Stacks). % one of the 3 elements, need to be that lis.
depthfirst(Nodem, []) :-
    goal(Node).
depthfirst(Node, []) :-
    goal(Node). %this still needs to be defined! but it is defined now with ^ 
depthfirst(Node, [NextNode]|Path) :-
    move(Node, NextNode),
    depthfirst(NextNode, Path). 
solve_depthfirst(Node, [Node|Path]) :-
    depthfirst(Node, Path). 
% ?- solve_depthifrst([[a,b,c,],[].[]], PLan).
move_cyclefree(Visited, Node, NextNode) :-
    move(Node, NextNode),
    \+ member(NextNode, Visited).
% Visited is instantiated with the list of nodes visited already. 
depthfirst_cyclefree(Visited, Noce, Visited) :- % base case
    goal(Node).
depthfirst_cyclefree(Visited, Node, Path) :- % to get the right path, without the ones visited
    move_cyclefree(Visited, Node, NextNode),% the moment you backtrack, you Variabele Visited will exclude the visited when backtracked reversed. 
    depthfirst_cyclefree([NextNode|Visited], NextNode, Path).
solve_depthfirst_cyclefree(Node, Path) :-
    depthfirst_cyclefree([Node], Node, RevPath),
    reverse(RevPath, Path). 
% a shorter solution, doesnt take 60 moves to find
solve_depthfirst_bound(Bound, Node, Path) :-
    depthfirst_bound(Bound, [Node], Node, RevPath),
    reverse(RevPath, Path).
%goal reached
depthfirst_bound(_, Visited, Node, Visited) :-
    goal(Node).
%recursive call, counting down in 'bound'
depthfirst_bound(Bound, Visited, Node, Path) :-
    Bound > 0,
    move_cyclefree(Visited, Node, NextNode),
    NewBound is Bound - 1,
    depthfirst_bound(NewBound, [NextNode|Visited], NextNode, Path).
solve_breathfirst(Node, Path) :-
    breadthfirst([[Node]], RevPath), 
    reverse(RevPath, Path). 
breadthfirst([[Node|Path]|_], [Node|Path]) :-
    goal(Node).
breadthfirst([Path|Paths], SolutionPath) :-
    expand_breadthfirst(Path, ExpPaths),
    append(Paths, ExpPaths, NewPaths),
    breadthfirst(NewPaths, SolutionPath). 
expand_breadthfirst([Node|Path], ExpPaths) :-
    findall([NewNode, Node | Path], 
        move_cyclefree(Path, Node, NewNode),
    ExpPaths).
path(Node, Node, [Node]).
path(FirstNode, LastNode, [LastNode|Path]) :- 
    path(FirstNode, SecondLastNode, Path),
    move_cyclefree(Path, SecondLastNode, LastNode). % after backtracking, this rule is used to allow a different intermediate step.  
solve_iterative_deepening(Node, Path) :-
    path(Node, GoalNode, RevPath),
    goal(GoalNode),
    reverse(RevPath, Path). 
solve_astar(Node, Path/Cost) :-
    estimate(Node, Estimate),
    astar([[Node]/0/Estimate], RevPath/Cost/_), %we dont case about the estimate if weve already found the answer (_)
    reverse(RevPath, Path). % [Node] has todo with the todo list. 
move_astar([Node|Path]/Cost/_, [NextNode, Node|Path]/NewCost/Est) :-
     move(Node, NextNode, StepCost), % use the original move/3
     \+ member(NextNode, Path), % prevent cycles
     NewCost is Cost + StepCost, % update cost of current path
     estimate(NextNode, Est). % estimate for the new path
expand_astar(Path, ExpPaths) :-
    findall(NewPath, move_astar(Path, NewPath), ExpPaths). 
%base case
get_best([Path], Path) :- !. % if i dont have a choise, then this is the best one. ! for we dont want to allow backtracking from first get_best to second get_best. 
% because that would give us the example of when we have the empty list in the first argument. it says: If there is only 1 thing in youre list, then that is the 
% best thing in youre list, and there is no second best thing
/* recursive call: from a list of labelled paths, select one that
 * minimizes the sum of current cost and current estimate. */
get_best([Path,1/Cost1/Est1, _/Cost2/Est2 | Paths], BestPath) :-
    Cost1 + Est1 =< Cost2 + Est2, !, % if 1 is lower or equal then the 2, then you can ignore the second path.
    get_best([Path1/Cost1/Est1 | Paths], BestPath).
get_best([_ | Paths], BestPath) :- % this allows backtracking for finding a second best thing. 
    get_best(Paths, BestPath). % and ofoucrse if the second fails. if path 1 isnt lowe then 2.
% stop in case the best path ends in a goal node
astar(Paths, Path) :-
    get_best(Paths, Path),
    Path = [Node|_]/_/_,
    goal(Node).
/* Otherwise, extract Best path, generate all expansions, and 
 * continue with union of remaining and expanded paths: */

astar(Paths, SolutionPath) :-
    get_best(Paths, BestPath),
    select(BestPath, Paths, OtherPaths),
    expand_astar(BestPath, ExpPaths),
    append(OtherPaths, ExpPaths, NewPaths),
    astar(NewPaths, SolutionPath).