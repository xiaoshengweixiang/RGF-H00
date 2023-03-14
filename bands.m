function bands(H00,H01,N,num)
    if nargin < 3
        N = 1; % default value for width
    end
    if nargin < 4
        num = 1001;
    end
    state=length(H00)/N;
    Energy=zeros(state*N,num);
    k=linspace(-1,1,num);
    for i=1:num
        H=H00+H01*exp(1j*k(i)*pi)+H01'*exp(-1j*k(i)*pi);
        eigenvalue=eig(H);
        Energy(:,i)=real(eigenvalue);
    end
    figure;
    plot(k,Energy,'black')
    xlabel('kx/pi')
    ylabel('E')
    text=sprintf('band stucture');
    title(text);
end