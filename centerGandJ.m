function [center] = centerGandJ(x,best)
center=best.Coefficients.Estimate(2)*x+best.Coefficients.Estimate(1);
end

