function [bottom] = lowerGandJ(x,best,low)
bottom=best.Coefficients.Estimate(2)*x+best.Coefficients.Estimate(1)+low;
end

