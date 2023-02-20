# A Theory of Countercyclical Government Multiplier: Code and Data

This repository contains the code and data accompanying the article ["A Theory of Countercyclical Government Multiplier"](https://pascalmichaillat.org/2/), written by [Pascal Michaillat](https://pascalmichaillat.org), and published in the [American Economic Journal: Macroeconomics](https://doi.org/10.1257/mac.6.1.190) in January 2014.

## Data

The folder `data` contains publicly available datasets obtained from the Bureau of Labor Statistics (BLS) and used to calibrate the model. The datasets describe the following labor market variables:

* `CPS-UL-2012.txt` – unemployment level from the Current Population Survey (CPS)
* `CPS-UR-2012.txt` – unemployment rate from CPS
* `MSPC-EMP-2012.txt` – employment level from Major Sector Productivity and
Costs (MSPC)
* `MSPC-OUTPUT-2012.txt` – output level from MSPC
* `JOLTS-JOLNF-2012.txt` – job-opening level in the nonfarm business sector from
the Job Opening and Labor Turnover Survey (JOLTS)
* `JOLTS-TSRNF-2012.txt` – total separation rate in the nonfarm business sector
from JOLTS
* `CES-EMPNF-2012.txt` – employment level in the nonfarm supersector from the
Current Employment Survey (CES)
* `CES-EMPPRIV-2012.txt` – employment level in the private supersector from
CES
* `CES-EMPGOV-2012.txt` – employment level in the government supersector
from the CES

The readme files `CES_README.txt`, `CPS_README.txt`, `MSPC_README.txt`, and `JOLTS_README.txt` provide details on the data.

## Code

The results are produced with Matlab and Dynare code.

### Dynare scripts

The simulations of the New Keynesian model rely on a number of Dynare scripts, which are directly called by Matlab scripts. The Dynare scripts simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, for different underlying public-employment policies. The typical script is called `modelWxYZ.mod`, where

* `W` = `NK` is there is no public-employment response; `W` = `G` if there is a public- employment response simultaneously to the technology shock
* `x` = `m` if the technology shock is negative; `x` = ` `  if the technology shock is positive
* `Y` = `1`, `3`, `5`, `7`, `9`, `11`, `13`, `17`, `21` indicates the amplitude of the technology shock
* `Z` = `G` if the underlying government policy is to keep public employment at a
constant level over time; `Z` = `B` is the underlying government policy is to keep
public employment at a constant fraction of private employment over time

### Matlab helper functions

The Matlab scripts also call the following Matlab helper functions:

* `BLS.m` – compute the average of key labor market variables in US data for the 2001–2011 period
* `STEADYB.m` – compute the steady state of the calibrated New Keynesian model
* `SETUPB.m` – calibrate the parameters of the New Keynesian model, as summarized in Table 2

### Matlab scripts

The following Matlab scripts compute the simulations discussed in the manuscript and plot the results. These Matlab scripts call the Dynare scripts that simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, when the underlying level of public employment is constant.

* `plotirfdispeG.m` – compute the impulse response functions to a positive technology shock with and without a public-employment response; it also computes the corresponding instantaneous multiplier; the impulse response functions are displayed in Figure 2; the instantaneous multiplier is displayed in Figure 4(a)
* `plotirfdisprG.m` – compute the impulse response functions to a negative technology shock with and without a public-employment response; it also computes the corresponding instantaneous multiplier; the impulse response functions are displayed in Figure 3; the instantaneous multiplier is displayed in Figure 4(b)
* `plotcumulativeG.m` – compute the cumulative multipliers corresponding to many technology shocks, both negative and positive; the cumulative multiplier is displayed in Figure 5


The following Matlab script computes the cumulative multipliers that are discussed in Appendix B. This script calls the Dynare scripts that simulate the calibrated New Keynesian model in response to a given technology shock, with or without a public-employment response, when the underlying level of public employment is a constant fraction of private employment. 

* `plotcumulativeB.m` –  compute cumulative multipliers when public employment is a constant fraction of private employment; the cumulative multipliers are displayed in Figure B1

## Software

The results were obtained on a Mac running OS X Mountain Lion with the following software:

* Matlab R2012a
* Dynare 4.2.5

## License

The content of this repository is licensed under the terms of the MIT License.
