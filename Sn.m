function S4 = Sn(r,tetha)
    ndim=4;
    RN =eye(ndim);
    for i = 1:(ndim-1)
        for j =1:i;
            R =eye(ndim);
            R(ndim-i,ndim-i)      = cos(tetha);
            R(ndim+1-j,ndim+1-j)  = cos(tetha);
            R(ndim+1-j,ndim-i)    = sin(tetha);
            R(ndim-i,ndim+1-j)    = -sin(tetha);
            RN = RN*R;
        end
    end
   S4 = r*RN;
end