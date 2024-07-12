The code begins by defining the equation to be solved. This involves defining the symbolic variables and their relationships.
**The code that is triggered with this question is:**

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
          
            end
            
**When the code is asked to solve a normal equation regarding x and y, then it triggers this line of code:**

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
**Not only does it solve the equation, but it is also programmed to display the step by step process of solving that certain equation:**

        % Display the steps and the solution
        disp('Step-by-step solution:');
        disp('1. Convert the equation to symbolic form.');
        disp(['   LHS: ', char(lhsSym)]);
        disp(['   RHS: ', char(rhsSym)]);
        disp('2. Solve the equation.');
        disp(['   Solution: x = ', char(solution)]);
  
    end


**If the program is asked to solve a set of equations, then the code triggered would be:**


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
  **Just as in the normal equation, this program is also designed to show the step by step process:**
          
           % Display the steps and the solution
        disp('Step-by-step solution:');
        disp('1. Convert the system to symbolic form.');
        disp(['   Equations: ', char(eqnsSym)]);
        disp('2. Solve the system of equations.');
        disp(['   Solution: x = ', char(solution.x)]);
        disp(['            y = ', char(solution.y)]);
        disp(['            z = ', char(solution.z)]);
   
    end


**Finally, if the equation asked is a graphical function, then the code triggered would be:**


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

**The graphical part of the program does not solve the equation based on x and y or even z, but only opens a pop up of what the graph would look like with detail:**


     % Display the steps
        disp('Step-by-step solution:');
        disp('1. Convert the function to symbolic form.');
        disp(['   Function: ', char(funcSym)]);
        disp('2. Plot the function.');
    catch ME

**If in any step there seems to be a problem or the program cannot continue due to a malfunction on the equation asked, then in each part of the code regarding each type of algebraic equation, an error message would be triggered:**

       disp('Unsupported problem type. Please enter a valid algebraic problem.');

       disp(['Error: ', ME.message]);

       disp(['Error while solving the equation: ', ME.message]);

       disp(['Solving the system of equations: ', equation]);

        disp(['Error while solving the system of equations: ', ME.message]);

         if isempty(plotIdx)
            error('The command must contain the word "plot".');

             catch ME
        disp(['Error while plotting the function: ', ME.message]);

**Well that would be it, this README file contains a clear explanation of each part of the code explaining how and why it works how it works. As a group we would like to thank you Mr, since throughout your classes, you have integrated a sense of understanding of coding and programming into us that we didn't have before. We will continue to implement this code since we found it incredibly helpfull for the future and would like to implement it to a point of even becoming a long term proyect or even a capstone idea for senior year. All the best to you and if in the future we get accepted into Brown once again, we would like to meet again to expand our knowledge once again. Thanks!**
