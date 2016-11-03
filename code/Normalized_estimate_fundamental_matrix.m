% Fundamental Matrix Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by Henry Hu

% Returns the camera center matrix for a given projection matrix

% 'Points_a' is nx2 matrix of 2D coordinate of points on Image A
% 'Points_b' is nx2 matrix of 2D coordinate of points on Image B
% 'F_matrix' is 3x3 fundamental matrix

% Try to implement this function as efficiently as possible. It will be
% called repeatly for part III of the project

function [ F_matrix ] = Normalized_estimate_fundamental_matrix(Points_a,Points_b)

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

%This is an intentionally incorrect Fundamental matrix placeholder
%F_matrix = [0  0     -.0004; ...
%            0  0      .0032; ...
%            0 -0.0044 .1034];
 
mean_a = mean(Points_a);
Centred_a = Points_a - repmat(mean_a, [size(Points_a,1), 1]);
var_a = var(Centred_a);
sd_a = sqrt(var_a);
Ta = [1/sd_a(1), 0,0; 0,1/sd_a(2), 0; 0,0,1]*[1,0,-mean_a(1);0,1,-mean_a(2);0,0,1];
Normalized_a = Ta * [Points_a'; ones(1,size(Points_a,1))];
Normalized_a = Normalized_a';


%Centred_a = Points_a - repmat(mean_a, [size(Points_a,1), 1]);
%Normalized_a = Centred_a ./ repmat(sd_a, [size(Points_a,1),1]);

mean_b = mean(Points_b);
Centred_b = Points_b - repmat(mean_b, [size(Points_b,1), 1]);
var_b = var(Centred_b);
sd_b = sqrt(var_b);
Tb = [1/sd_b(1), 0,0; 0,1/sd_b(2), 0; 0,0,1]*[1,0,-mean_b(1);0,1,-mean_b(2);0,0,1];
Normalized_b = Tb * [Points_b'; ones(1,size(Points_b,1))];
Normalized_b = Normalized_b';
%Centred_b = Points_b - repmat(mean_b, [size(Points_b,1), 1]);
%Normalized_b = Centred_b ./ repmat(sd_b, [size(Points_b,1),1]);

%a1 = Normalized_a ones(size(Points_a,1),1)];
a1 = Normalized_a;
a1_u = a1 .* repmat(Normalized_b(:,1), [1,3]);
a1_v = a1 .* repmat(Normalized_b(:,2), [1,3]);
A = [a1_u a1_v a1];

[U,S,V] = svd(A);
f = V(:,end);
F = reshape(f, [3,3])';

[U,S,V] = svd(F);
S(3,3) = 0;
F = U*S*V';

F_matrix = Tb' * F * Ta;

end

