function dist = euclid(v1, v2)
% %=======================================================================
% This function computes Eucledian Distance between vector v1 and v2
% Author: Dheeraj Sharma
% Date modified: 20 December 2020
% %=======================================================================

V = v1-v2;
dist = sqrt(V * V');
end
