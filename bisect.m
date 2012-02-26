function [root, ea, iter] = bisect(f, xl, xu, es, maxit)
% Function bisect returns the roots
% of equation f between the upper and lower 
% limits xu and xl
% input:
%	f	-	equation
%	xl	-	lower boundry
%	xu	-	upper boundry
%	es	-	stopping criteria
%	maxit	-	maximum iterations
% output:
%	root	-	x where f is zero
%	ea	-	approximate error
%	iter	-	number of iterations
%
% pre:
%	xl	<	xu
%	0	<	abs(es)
%	0	>	f(xl) * f(xu)
%	0	<	maxit
% post:
%	f(root) ->	0
%	ea	<	es
%	iter	<	maxit


% Forcing preconditions if necessary
if (f(xl) * f(xu) > 0)
% force exit.
	return; % add exception later
end%if
if (xu < xl)
% then swap the values
	tmp = xl;
	xl = xu;
	xu = tmp;
end%if

if (es <= 0)
% set to default value
	es = 0.0001;
end%if

if (maxit <= 0)
% set to default value
	maxit = 50000;
end%if

% Declaring variables for the loop
iter = 0;
ea = 100;

while((iter < maxit) && (ea < es))

	if (iter > 0)
		xold = xr;
	end%if

	xr = (xu + xl) / 2;

	if (f(xr)*f(xl) > 0)
		xl = xr;
	elseif (f(xr) ~= 0)
		xu = xr;
	else
		ea = 0;
	end%if

	if ((iter > 0) && (ea ~= 0) && (xr ~= 0))
		ea = abs((xr - xold) / 100);
	end%if
	
	iter++;
end%while

root = xr;
iter++;

end%function
