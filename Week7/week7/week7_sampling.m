%% ACM 11 Week 7 Exercise 1

% The goal of this exercise is to walk through some of MATLAB's
% capabilities for working with random variables and plotting.

% We will model a coin toss using MATLAB's RANDI function. 
%
% RANDI(Imax,N,M) will return an N-by-M matrix of random integers from 1 to
% Imax. We will set Imax = 2, so that we get either a 1 or a 2. 
%
% Because it's common to model coin tosses as Heads = 1 and Tails = 0, we
% will subtract 1 from the result of RANDI to get our results.

%% Names of all group members: 
% Kyle McGraw, Dallas Taylor

clear 

%% Problem 1
% we start by using RANDI as described above to generate N = 10 coin toss
% results. run the code below a few times (use the "Run Section" button in 
% the top menu) and look at the results variable in the command window. 
% When you think you have a good idea of what's going on, move onto Problem 2.

N = 10;
results = randi(2,N,1) - 1
num_heads = sum(results)

%% Problem 2
% when we toss a coin 10 times, we expect to get 5 heads. However,
% sometimes we might get more and sometimes we might get less. In this
% problem, we want to see what happens when we repeat our 10-coin-toss
% experiment M times.

% (i) set the number of experiments M to 20 to start. (We will set it to
% 500 later)
M = 20;
% (ii) use randi to generate a N-by-M matrix of random values 0 and 1. 
results = randi(2,N,M)-1
% (iii) in your matrix, each of the M columns represents one set of 10 coin
% tosses. Use SUM to calculate the number of heads that turned up in each
% set of 10 tosses. By default, SUM will operate column-wise. Your result
% should be a 1-by-M vector.
SUM = sum(results)
% (iv) Use the MATLAB functions MAX, MIN, and MEAN to calculate the max, min,
% and mean # of heads across your M = 20 experiments of N = 10 tosses each.
MAX = max(SUM)
MIN = min(SUM)
MEAN = mean(SUM)
% (v) Use the MATLAB function VAR to calculate the variance of the # of
% heads across your M = 20 experiments.
VAR = var(SUM)
% (vi) run this section of code a few times. Make sure you feel your results 
% are reasonable before moving on.
% Seems reasonable
%% Problem 3
% Each of the M experiments of N coin tosses (ie each column of your
% results matrix) can be used to estimate the probability of flipping heads
% as follows: p_hat = num_heads/N

% (i) Use your coin toss results from Problem 2 to calculate the estimated
% probability of flipping heads for each experiment (each column) as
% described above. You can copy and paste code into this section, or delete
% one "%" in front of Problem 3 to join this section with Problem 2 so it
% all runs together.
N = 10
M = 500
results = randi(2,N,M)-1
num_heads = sum(results)
p_hat = num_heads/N

VAR = var(p_hat)
% (ii) Use the MATLAB function HISTOGRAM to plot your estimated probability
% values. HISTOGRAM(VALUES,EDGES) will plot a histogram of VALUES with the
% edges of each histogram bar specified by EDGES. Since the possible
% probability estimates range from 0 to 1, use EDGES = -0.05:0.1:1.05
%
% With just 20 experiments, the random results may sometimes come out a
% little funny. If you experience this, try increasing M to 500. Then you
% should get a fairly consistent plot.
HISTOGRAM = histogram(p_hat,-0.05:0.1:1.05)
% (iii) Uncomment the three lines below for proper labels on your histogram

xlabel('Estimated probability of heads')
ylabel('Count') % this means the # of experiments out of M that led to this estimate
title(['Outcomes of ',num2str(M),' experiments of ',num2str(N),' coin tosses'])

%% Problem 4
% (i) If you haven't already, set M = 500 in your code above. We are going to
% do 500 copies of the coin toss experiment with N tosses.

% (ii) Run your code above a few times each with N = 10, N = 100, N = 1000.
% (Either combine Problem 1 with the rest of the sections, or add a line
% setting N at the beginning of Problem 2)

% (iii) How does the range of possible results of your M = 500 experiments change
% as the number of tosses per experiment N changes?

% As we increase N, the range of possible results narrows with only
% probability of 0.5 for N = 1000;

% (iv) Use the MATLAB function VAR to calculate the variance of heads
% probability estimates across your M = 500 experiments. How does this
% variance change as N changes? Does this match the histograms?

% Variance decreases as N increases, this matches the histograms.