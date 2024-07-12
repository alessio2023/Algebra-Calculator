% The parts written in green like this one, explain the code and what each
% part does to the calculator. 

%% 



function algebraic_calculator()
    clc;
    disp('Welcome to the Algebraic Calculator');
    disp('Type "exit" to quit.');
    
    while true
        % Get user input
        problem = input('Enter an algebraic problem: ', 's');
        
        if strcmp(problem, 'exit')
            disp('Exiting the calculator. Goodbye!');
            break;
        end
        
        try
            % Determine the type of problem
            if contains(problem, 'plot')
                % Graph the function
                graph_function(problem);
            elseif contains(problem, '==') && contains(problem, '[') && contains(problem, ']')
                % Solve the system of equations
                solve_system(problem);
            elseif contains(problem, '=')
                % Solve the equation
                solve_equation(problem);
            else
                disp('Unsupported problem type. Please enter a valid algebraic problem.');
            end
        catch ME
            disp(['Error: ', ME.message]);
        end
    end
end

function solve_equation(equation)
    disp(['Solving the equation: ', equation]);
    
    
    try
        % Find the '=' sign and split the equation
        equalSignIdx = strfind(equation, '=');
        if isempty(equalSignIdx)
            error('The equation must contain an "=" sign.');
        end
        
        lhs = equation(1:equalSignIdx-1);
        rhs = equation(equalSignIdx+1:end);
        
        % Convert to symbolic expressions
        syms x;
        lhsSym = str2sym(lhs);
        rhsSym = str2sym(rhs);
        
        % Solve the equation
        solution = solve(lhsSym == rhsSym, x);
        
        % Display the steps and the solution
        disp('Step-by-step solution:');
        disp('1. Convert the equation to symbolic form.');
        disp(['   LHS: ', char(lhsSym)]);
        disp(['   RHS: ', char(rhsSym)]);
        disp('2. Solve the equation.');
        disp(['   Solution: x = ', char(solution)]);
    catch ME
        disp(['Error while solving the equation: ', ME.message]);
    end
end

function solve_system(equation)
    disp(['Solving the system of equations: ', equation]);
    
    % Parse the system of equations
    try
        % Remove the brackets
        equation = strrep(equation, '[', '');
        equation = strrep(equation, ']', '');
        
        % Split the equations by commas
        eqns = split(equation, ',');
        
        % Convert to symbolic expressions
        syms x y z;
        eqnsSym = arrayfun(@str2sym, eqns);
        
        % Solve the system of equations
        solution = solve(eqnsSym, [x, y, z]);
        
        % Display the steps and the solution
        disp('Step-by-step solution:');
        disp('1. Convert the system to symbolic form.');
        disp(['   Equations: ', char(eqnsSym)]);
        disp('2. Solve the system of equations.');
        disp(['   Solution: x = ', char(solution.x)]);
        disp(['            y = ', char(solution.y)]);
        disp(['            z = ', char(solution.z)]);
    catch ME
        disp(['Error while solving the system of equations: ', ME.message]);
    end
end

function graph_function(command)
    disp(['Graphing the function based on command: ', command]);
    
    try
        % Extract the function to plot
        plotIdx = strfind(command, 'plot');
        if isempty(plotIdx)
            error('The command must contain the word "plot".');
        end
        
        func = command(plotIdx+4:end);
        func = strtrim(func);
        
        % Convert to symbolic expression
        syms x;
        funcSym = str2sym(func);
        
        % Plot the function
        fplot(funcSym, 'LineWidth', 2);
        title(['Graph of ', char(funcSym)]);
        xlabel('x');
        ylabel('y');
        grid on;
        
        % Display the steps
        disp('Step-by-step solution:');
        disp('1. Convert the function to symbolic form.');
        disp(['   Function: ', char(funcSym)]);
        disp('2. Plot the function.');
    catch ME
        disp(['Error while plotting the function: ', ME.message]);
    end
end

% Run the algebraic calculator
algebraic_calculator();