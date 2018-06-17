tic;
initial_pi = load('hw7_initialStateDistribution.txt');
emission_b = load('hw7_emissionMatrix.txt');
transit_a = load('hw7_transitionMatrix.txt');
observation = load('hw7_observations.txt');
matrix_l = zeros(27,240000);
matrix_l(:,1) = log(initial_pi)+log(emission_b(:,observation(1)+1));
phi = zeros(27,240000);
%-----------
for index=2:240000
    dup_lit = matrix_l(:,index-1)*ones(1,27);
    max_of_column = dup_lit+log(transit_a);
    [max_value,row_indix] = max(max_of_column);
    update_l = max_value.'+log(emission_b(:,observation(index)+1));
    matrix_l(:,index) = update_l;
    phi(:,index) = row_indix.';
end
%----------
[s_T,s_T_index] = max(matrix_l(:,240000));
state = zeros(1,240000);
state(1) = s_T_index;
num_column = 240000;
for i=2:240000
    next = phi(state(i-1),num_column);
    state(i)=next;
    num_column =num_column-1;
end
final_state = flip(state,2);
x=[1:1:240000];
figure(1)
plot(x,final_state);
title('most likely sequence of hidden states versus time');
xlabel('time n');
ylabel('hidden state');
toc;