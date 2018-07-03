# CPUs

There are hundreds of different CPUs on the market today. Due to a stagnation in the market, models from 5 years ago can still compete with new releases. I was curious to explore what the best value CPUs were that were still able to compete with modern CPUs.


## Methods

Data was manually downloaded from [CPU Benchmark](https://www.cpubenchmark.net/) for both single core performance and total CPU performance. Excel was employed since it was just as easy to copy and paste it into Excel than webscraping it. Sometimes working smarter is better than working harder!

Data was merged in R and simple feature engineering was employed in order to obtain model and brand information. A simple linear model was performed in conjunction with CPU performance in order to get the underpriced CPUs.

## Results

The following CPUS are the top obtained in R:

![Top CPUs](https://raw.githubusercontent.com/cajpearce/CPUs/master/images/CPUs.PNG)


## Shortfalls

Pricing data was obtained from [CPU Benchmark](https://www.cpubenchmark.net/) and is therefore unlikely to reflect both secondhand and New Zealand prices.
