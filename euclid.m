function dist = euclid(v1, v2)
% %=======================================================================
% This function computes Eucledian Distance between vector v1 and v2
% Author: Arwan Ahmad Khoiruddin
% Date modified: 30 March 2016
% %=======================================================================

V = v1-v2;
dist = sqrt(V * V');
end