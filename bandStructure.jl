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

energies1 = zeros(200, 200);
energies2 = zeros(200, 200);
for i=1:200
    for j=1:200
        e = eigvals(h([qxs[i], qys[j]]));
        energies1[i, j] = e[1];
        energies2[i, j] = e[2];
    end
end

surf(qxs, qys, energies1);
surf(qxs, qys, energies2);
PyPlot.xlabel(L"$q_x$");
PyPlot.ylabel(L"$q_y$");
PyPlot.zlabel(L"$\epsilon (k)$");
PyPlot.title("Energy dispersion relation around K point");
PyPlot.view_init(elev=0, azim=45);
PyPlot.show();
#PyPlot.savefig("fig1.png");
