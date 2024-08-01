% default input file

% How to represent particle size distribution?
% PL:    power law
% LN:    log-normal
% PLLN:  combined power law and log-normal
% FSn:   fixed-sectional, where n is the number of sections 
p.model = 'FS40';

% Method for solving a system of equations in PL and PLLN models
% 1: interpolation table
% 2: Levenberg-Marquardt iterative algorithm
p.PLEquations = 2;

% new particle formation rates, J
% first row:    times (s)
% second row:   J (#/cm3 s)
p.JMatrix = [0 3600; 0 1];

% Diameter of a newly formed particle (m)
% It is also the lowest diameter in the FS model.
p.dCluster = 1e-9;

% The highest diameter in the FS model
p.highestDiameter = 100e-9;

% condensational growth rates, GR
% first row:    times (s)
% second row:   GR (m/s)
p.GRMatrix = [0 3600; 0 3e-12];

% Is condensational transfer on?
% Only applicable with the PLLN model
p.condensationalTransfer = 1;

% Condensational transfer factor
p.condensationalTransferFactor = 0.5;

% Is coagulation on?
p.coag = 1;

% Is coagulational transfer from the PL distr. to LN distr. on?
% Only applicable with the PLLN model
p.coagulationalTransfer = 1;

% Size bins in numerical integration of coagulation terms
p.binsInCoagulation = 20;

% Are integrals of coagulation terms always calculated numerically?
p.numericCoagulation = 0;

% Temperature (K)
p.T = 300;

% Air viscosity (Pa s)
p.visc = viscosity(p.T);

% Particle density (kg/m3)
p.rho = 1000;

% Does GR depend on particle size? (not yet in this version)
p.sizeDependentGR = 0;
% If it does...
    
%     p.dsa = 0.5638e-9;
%     p.diffsa = diff_sa(p.T);
%     p.CsaInf=0.8e7*1e6*1.381e-23*0.098079/8.3145;
%     p.CsaSat=vappressa(p.T)*0.098079/8.3145/p.T;
%     p.rh=0.6;
%     p.numericCondensation = 0;
%     p.condBins = 200;

% Is coagulation to background mode modelled?
p.coagSink = 0;

% If it is...
    % CMD of background distribution (m)
    p.coagSinkCMD = 100e-9;
    % Exponent
    p.coagSinkExponent = -1.6;
    % Number conc of background distribution (#/cm3)
    p.coagSinkN = 1e3;

% Are particle losses modelled?
p.losses = 1;
% If they are...
    % Loss coefficient (m/s)
    p.lossesCoeff = 5e-13;
    % Exponent
    p.lossesExponent = -1;
    
% Time vector (s)
p.timeVec = 0:3600;

% Method for giving initial PSD 
p.initialPSDMethod = 'LN parameters';

% Initial PSD parameters if LN parameters are given
p.initialPSDParameters = [1e5,2,100e-9];

% Initial moment vector
p.initialMomentVec = zeros(1,6);

% ODE solver
p.solverName = 'ode45';

% Relative tolerance for ODE solver
p.relativeTolerance = 1e-3;

% Plot distribution during simulation
p.plotDistrDuringSim = 1;

% Plot waitbar during simulation
p.plotWaitbarDuringSim = 1;

% Plot output after simulation
p.plotOutputAfterSim = 1;
