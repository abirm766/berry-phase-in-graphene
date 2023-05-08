# Numerical Calculation of Berry phase for Monolayer Graphene  
The Berry phase of Graphene is calculated using numerical methods, starting from the Low energy Hamiltonian. The computation is implemented in [Julia](https://julialang.org/) (1.5.3 or later).  
## Usage  
nn  
## Theory  
The Low energy Hamiltonian near one of the the Dirac points,
```math
\mathcal{H}=v_F
\begin{pmatrix}
  0 & p_x+ip_y \\
  p_x-ip_y & 0 
 \end{pmatrix}
```  
Here, $v_F=\frac{3at}{2}$ is the Fermi velocity, $t$ is the hopping parameter. The corresponding eigenstates (pseudospins),  
```math
E_{\pm} = \pm v_F|p| \;\; and \;\; \psi_{\pm} = \frac{1}{\sqrt{2}}\begin{pmatrix}
        1\\
        \pm e^{-i\phi}
\end{pmatrix}e^{i\frac{\vec{\boldsymbol{p}}.\vec{\boldsymbol{r}}}{\hbar}}
```  
Note, $p$ (momentum) is the parameter space for the Hamiltonian. Now, choose any of the eigenstates say $\psi_+$ and adiabatically evolve this state in a closed loop in the parameter space. Hence calculate the Berry phase,
```math
    \theta = -i\oint_C \bra{\psi(\vec{\boldsymbol{p}})}\vec{\boldsymbol{\nabla}_{\vec{\boldsymbol{p}}}}\ket{\psi(\vec{\boldsymbol{p}})}.d\vec{\boldsymbol{p}}
```
