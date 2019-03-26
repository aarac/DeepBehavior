function S = BB_area(i, body_type, k)

% calculates the area of the bounding box for the ith frame and kth
% rectangle for that frame. body_type signifies which mouse it is.
% k can only be 1 or 2.
% body_type can only body or body_mini.


left = body_type(i,4*(k-1)+1);
top = body_type(i,4*(k-1)+2);
right = body_type(i,4*(k-1)+3);
bottom = body_type(i,4*(k-1)+4);

S = (right-left)*(bottom-top);

end

