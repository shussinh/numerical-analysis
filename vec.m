function [ r, varargout ] = vec(A, B)

r = A - B;

% Magnitude of r
varargout{1} = norm(r);

% Unit vector of r
varargout{2} = r/norm(r);

end