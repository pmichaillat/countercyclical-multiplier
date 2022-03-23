# A Theory of Countercyclical Government Multiplier: Code and Data

This repository contains the code and data accompanying the paper "A Theory of Countercyclical Government Multiplier", written by [Pascal Michaillat](https://pascalmichaillat.org), and published in the [American Economic Journal: Macroeconomics](https://doi.org/10.1257/mac.6.1.190) in January 2014.

## Paper webpage

The paper is available at https://pascalmichaillat.org/2/.

## Data

The folder `data` contains the datasets used to calibrate the paper's model. The datasets are constructed by the Bureau of Labor Statistics (BLS) and are publicly available. The datasets describe the following labor market variables:

+ `CPS-UL-2012.txt` - Unemployment level from the Current Population Survey (CPS)
+ `CPS-UR-2012.txt` - Unemployment rate from CPS
+ `MSPC-EMP-2012.txt` - Employment level from Major Sector Productivity and
Costs (MSPC)
+ `MSPC-OUTPUT-2012.txt` - Output level from MSPC
+ `JOLTS-JOLNF-2012.txt` - Job-opening level in the nonfarm business sector from
the Job Opening and Labor Turnover Survey (JOLTS)
+ `JOLTS-TSRNF-2012.txt` - Total separation rate in the nonfarm business sector
from JOLTS
+ `CES-EMPNF-2012.txt` - Employment level in the nonfarm supersector from the
Current Employment Survey (CES)
+ `CES-EMPPRIV-2012.txt` - Employment level in the private supersector from
CES
+ `CES-EMPGOV-2012.txt` - Employment level in the government supersector
from the CES

The readme files `CES_README.txt`, `CPS_README.txt`, `MSPC_README.txt`, and `JOLTS_README.txt` provide details on the data.

## Code

The paper's results are obtained using MATLAB and Dynare.

### Dynare scripts

The simulations of the New Keynesian model rely on a number of Dynare scripts, which are directly called by MATLAB scripts. The Dynare scripts simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, for different underlying public-employment policies. The typical script is called `modelWxYZ.mod`, where

+ `W` = `NK` is there is no public-employment response, and `W` = `G` if there is a public- employment response simultaneously to the technology shock.
+ `x` = `m` if the technology shock is negative, and `x` = ` `  if the technology shock is positive.
+ `Y` = `1`, `3`, `5`, `7`, `9`, `11`, `13`, `17`, `21` indicates the amplitude of the technology shock.
+ `Z` = `G` if the underlying government policy is to keep public employment at a
constant level over time, and `Z` = `B` is the underlying government policy is to keep
public employment at a constant fraction of private employment over time.

### MATLAB helper functions

The MATLAB scripts also call the following MATLAB helper functions:

+ `BLS.m` - Compute the average of key labor market variables in US data for the 2001–2011 period
+ `STEADYB.m` - Compute the steady state of the calibrated New Keynesian model
+ `SETUPB.m` - Calibrate the parameters of the New Keynesian model, as summarized in Table 2

### MATLAB scripts

The following MATLAB scripts compute the simulations discussed in the article and plot the results. These MATLAB scripts call the Dynare scripts that simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, when the underlying level of public employment is constant.

+ `plotirfdispeG.m` - Compute the impulse response functions to a positive technology shock with and without a public-employment response. Also compute the corresponding instantaneous multiplier. Impulse response functions are displayed in Figure 2. Instantaneous multiplier is displayed in Figure 4(a).
+ `plotirfdisprG.m` - Compute the impulse response functions to a negative technology shock with and without a public-employment response. Also compute the corresponding instantaneous multiplier. Impulse response functions are displayed in Figure 3. Instantaneous multiplier is displayed in Figure 4(b).
+ `plotcumulativeG.m` - Compute the cumulative multipliers corresponding to many technology shocks, both negative and positive. Cumulative multiplier is displayed in Figure 5.

The following MATLAB script computes the cumulative multipliers that are discussed in Appendix B. This script calls the Dynare scripts that simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, when the underlying level of public employment is a constant fraction of private employment. 

+ `plotcumulativeB.m` - Compute cumulative multipliers when public employment is a constant fraction of private employment. Cumulative multipliers are displayed in Figure B1.

## Software

The results were obtained using MATLAB R2012a and Dynare 4.2.5 on macOS Mountain Lion.

## License

This repository is licensed under the [MIT License](LICENSE.md).

## Related code

+ [MATLAB and Dynare code to reproduce figures 2 and 3](https://github.com/IMFS-MMB/mmb-rep/tree/master/NK_MI14) - Written by the [Macroeconomic Model Database](https://www.macromodelbase.com)