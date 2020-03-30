clc
clear all
%% input data%%
D = xlsread('DPK.xlsx');
L = xlsread('loan.xlsx');
K = xlsread('K.xlsx');
n = size(D);
n=n(1);
%%
%%input parameter%%
kdlist  = K(:,1);
kllist  = K(:,2);
gdlist  = [];
wlist   = [];
gllist  = [];
blist   = [];
fminlist = [];
%%
for buku =1:4
    disp('-----------------------------------------')
    fprintf('Buku ke- %d \n',buku)
    disp('-----------------------------------------')
    kd      = kdlist(buku);
    kl      = kllist(buku);        
    [gd,w,gl,b,fmin] = spiral(buku,kd,kl,n,D,L);
    fprintf('gd = %f \n',gd)
    fprintf('w = %f \n',w)
    fprintf('gl = %f \n',gl)
    fprintf('b = %f \n',b)
    fprintf('fmin = %f \n',fmin)
    gdlist = [gdlist, gd];
    wlist  = [wlist, w];
    gllist = [gllist, gl];
    blist  = [blist, b];
    fminlist = [fminlist, fmin];
end
params = table(gdlist' , wlist', gllist', blist', fminlist');
writetable(params,'params.xlsx')



