function transmission(H00,H01,N,Emin,Emax,num)
    if nargin < 6
        num = 1001; % default value for num
    end
    if nargin < 5
        Emax =  5; % default value for Emax
    end
    if nargin < 4
        Emin = -5; % default value for Emin
    end
    if nargin < 3
        N = 1; % default value for width
    end
    Ef=linspace(Emin,Emax,num);
state=length(H00)/N;
for i=1:num
    
    E=Ef(i)+1j*10^(-6);
    time=25;
    ai=H01;bi=H01';ei=H00;eg=H00;
    for j=1:time
        mm=inv(E*eye(state*N)-ei);
        eg=eg+ai*mm*bi;
        ei=ei+ai*mm*bi+bi*mm*ai;
        ai=ai*mm*ai;bi=bi*mm*bi;
    end
    gr=inv(E*eye(state*N)-eg);
    hgh_R=H01*gr*H01';
    
    H10=H01';
    time=25;
    ai=H10;bi=H10';ei=H00;eg=H00;
    for j=1:time
        mm=inv(E*eye(state*N)-ei);
        eg=eg+ai*mm*bi;
        ei=ei+ai*mm*bi+bi*mm*ai;
        ai=ai*mm*ai;bi=bi*mm*bi;
    end
    gr=inv(E*eye(state*N)-eg);
    hgh_L=H10*gr*H10';
    
    GR_ii=inv(E*eye(state*N)-H00-hgh_L);
    GR_1j=GR_ii;
    
    for k=2:N
        GR_ii=inv(E*eye(state*N)-H00-H10*GR_ii*H01);
        GR_1j=GR_1j*H01*GR_ii;
    end

    GR_ii=inv(inv(GR_ii)-hgh_R);
    GR_1j=GR_1j+GR_1j*hgh_R*GR_ii;

    T_R=1j*(hgh_R-hgh_R');
    T_L=1j*(hgh_L-hgh_L');

    T_LR(i)=real(trace(T_L*GR_1j*T_R*GR_1j'));
end
figure;
plot(Ef,T_LR)
xlabel('Ef')
ylabel('T_{LR}')
title('Conductance')
end