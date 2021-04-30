function [pl,ql,pr,qr] = pdebc(yl,ul,yr,ur,t)
pl = [ul(1)-13; ul(2)-1];
ql = [0; 0];
pr = [ur(1)-13; ur(2)-1];
qr = [0; 0];
end