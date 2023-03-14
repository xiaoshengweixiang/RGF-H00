%This is a basic lead model with magnetic field
e0=0.1;% onsite energy
t=1.2;%hopping energy
N=10;%width of the system
phi=-0.2;%magnetic flux
%Hamiltonian
H00 = e0 * eye(N) + t * diag(ones(1, N-1), 1) + t * diag(ones(1, N-1), -1); 
H01 = t * diag(exp(1i *[1:N] * phi)); 
%Use bands function to obtain band structure
bands(H00,H01,N);

%Use transmission function to obtain Transmittance
transmission(H00,H01,N);