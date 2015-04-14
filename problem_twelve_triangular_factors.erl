-module(problem_twelve).
-export([solution/3, get_number_of_factors/1]).

solution(_, T, true) ->
    T;
solution(NaturalNumber, OldTriangleNumber, false) ->
    NewFactors = get_number_of_factors(OldTriangleNumber + NaturalNumber),
    solution(NaturalNumber + 1, OldTriangleNumber + NaturalNumber, NewFactors > 500).

get_number_of_factors(T) ->
    get_factors(T, erlang:trunc(math:sqrt(T)), 0).

get_factors(_, 0, NumFactors) ->
    NumFactors;
get_factors(T, Divisor, NumFactors) ->
    case T rem Divisor of 
        0 -> get_factors(T, Divisor - 1, NumFactors + 2);
        _ -> get_factors(T, Divisor - 1, NumFactors)
    end.