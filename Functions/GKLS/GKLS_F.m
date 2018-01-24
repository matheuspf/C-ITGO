% function f = GKLS_F(x)

% f = funcs(x);

% end



function [f, g] = GKLS_F(x)

if nargout > 1:
    [f, g] = funcs(x);
else
    f = funcs(x);
end

end