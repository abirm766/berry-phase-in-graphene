using LinearAlgebra
using PyPlot

function meshgrid(xin,yin)
    "creates grid point in x-y plane"
    nx=length(xin);
    ny=length(yin);
    xout=zeros(ny,nx);
    yout=zeros(ny,nx);
    for jx=1:nx
        for ix=1:ny
            xout[ix,jx]=xin[jx];
            yout[ix,jx]=yin[ix];
        end
    end
    return (x=xout, y=yout);
end

# k-space around Dirac point
qxs = range(-0.10, stop=0.10, length=200);
qys = range(-0.10, stop=0.10, length=200);

# Generate circular loop around K-point
r = 0.05;   # radius of the loop
qloopx = [r*cos(theta) for theta in range(0, stop=2π, length=100)];
qloopy = [r*sin(theta) for theta in range(0, stop=2π, length=100)];

# Create meshgrid for the grid of points
qx_grid, qy_grid = meshgrid(qxs, qys);

# Plot the loop and grid
scatter(qx_grid[:], qy_grid[:], s=1, color="blue");
plot(qloopx, qloopy, "r-", linewidth=2);
PyPlot.xlabel(L"$q_x$");
PyPlot.ylabel(L"$q_y$");
PyPlot.title("Circular Loop in k-space");
PyPlot.show();
#PyPlot.savefig("fig2.png");
