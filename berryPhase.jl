using LinearAlgebra
using PyPlot

a = 2.46;   # spacing between two neighbouring atoms (Angstrom)
t = 3.030;   # hopping parameter (eV)

# k-space around Dirac point
qxs = range(-0.10, stop=0.10, length=200);
qys = range(-0.10, stop=0.10, length=200);

# creation of low energy hamiltonian (near dirac point)
f(q) = q[1]+(im*q[2]);


function h(q)
    arr = zeros(ComplexF64, 2, 2);
    arr[1,2] = (3*a*t/2)*f(q);
    arr[2,1] = (3*a*t/2)*conj(f(q));
    return arr;
end

function eigen_state(q)
    """calculate eigenstate of h(k)"""
    eigvecs_h = eigvecs(h(q));
    return u = eigvecs_h[:, 1];
end

# Generate circular loop around K-point
r = 0.05;   # radius of the loop
qloopx = [r*cos(theta) for theta in range(0, stop=2π, length=100)];
qloopy = [r*sin(theta) for theta in range(0, stop=2π, length=100)];

# Calculate eigenstates around the loop
eigenstates = [];
for i = 1:length(qloopx)
    q = [qloopx[i], qloopy[i]];
    u = eigen_state(q);
    push!(eigenstates, u);
end

# Calculate Berry phase
theta = 0.0;
for i = 2:length(qloopx)
    delta_q = [qloopx[i]-qloopx[i-1], qloopy[i]-qloopy[i-1]];
    u_prev = eigenstates[i-1];
    u_curr = eigenstates[i];
    theta += angle(dot(conj(u_prev), u_curr));
end

# Print Berry phase
println("Berry phase: ", theta);
println("Deviation: ", abs(abs(theta)-pi));
