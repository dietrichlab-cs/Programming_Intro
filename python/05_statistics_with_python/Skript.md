# Fun With ~~Flags~~ Stats

## Intro
Recap:
- Start importing experiment data from treatment  "05_statistics_with_python/examples/data/example_1/example_1_treatments.csv"
- Grouping data
- Printing data
- Motivate Testing -> How do we find out if the difference is bigger than we can expect by chance?

## Start PPP
- Experiment to Random Variables
- Density function

## Distributions 
- Continous Distributions -> e.g. Measured values from 
- Discrete Distributions -> Coin Flip, RNA-Read Counts
- What distributions do you know? 

## Estimating Statistics
- Definitions of mean and variance 
- How to estimate this ?  
- Python Example

## Back to our start examplel 
- We want to find out if the measured difference is bigger than you would expect under randomness?

## Hypothesis and Errors
- Usually if we test we have a null hypothesis with an assumption, in our case it is that the expected value is equal and both random variables have the same distributions.
- The alternative hypothesis is than that the both means are different.
- If we test we can capture different types of errors. 
- Type 1 error -> the ground trouth is that the null hypothesis is true but we reject it and say that the means are different
- Type 2 error -> the ground truth is that the means are different but we do not reject the null hypothesis.
- How do we make our decisions ? Well we reject te null hypothesis if the probability to obserce the measured difference is more extreem than cou can expect under randomness.
- How to calculate p-Value ? 

## Wechs T - Test
- usually we use test statistics to transform the measured differcence into a space that follows a known distribution. 
- From there we can calculate p-Value.
- Back to python -> example 1 and example 2 until correction
- Show p-Values are equally distributed -> What can we do about this?

## Benjamini Hochberg Correction
- 