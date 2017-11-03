function [top]=upperGandJ(x, best, up);
top=best.Coefficients.Estimate(2)*x+best.Coefficients.Estimate(1)+up;
end
