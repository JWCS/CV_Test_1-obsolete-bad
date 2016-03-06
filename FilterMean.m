function Im2 = FilterMean(Im, S)
%FilterMean Filters the image matrix with an average at each pixel of 
%the ones around it of a centered box of side length S
%   Im must be an image matrix. S must be odd (centered) and > 1.
    tic
    [X, Y, Z] = size( Im );
    %Im2 = zeros( X, Y, Z );
    if S < 3
        error 'Mean filter size must be odd and > 1, ex. 3, 5, 7';
    end
    c = (S - 1) / 2;%The cropping factor from the edge (radius from s)
    Im2(1+c:X-c, 1+c:Y-c, 1:Z) = ...
        getXyAv( subMat( Im(:,:,1:Z), 1+c:X-c, 1+c:Y-c, S ));
    toc
end
function A = getXyAv(subMat)
    %Pass in a matrix of predetermined scale, a submatrix, and this will
    %add up all of the values and return the average, in xy plane
    [X, Y, ~] = size(subMat);
    A = sum(sum(subMat, 1, 'native'), 2, 'native')/(X*Y);
end