codebook
================
mariorod94
7/22/2020

# Getting and Cleaning Data Course Project

-----

## Project Description

The following data was obtained from the UCI HAR Datasets regarding 30
volunteers within 19 to 48 years old. Each activity was performed
wearing a Samsung Galaxy S II phone on the waist. Every person performed
the following activities:

1.  Walking  
2.  Walking upstairs  
3.  Walking downstairs  
4.  Sitting  
5.  Standing  
6.  Laying

Body linear acceleration and angular velocity were derived in time to
obtain Jerk signals and the magnitude of the three dimensional signals
was calculated using Euclidean norm. After a Fourier transformation, the
signals were used to estimate the feature vector for each pattern:

  - tBodyAcc-XYZ  
  - tGravityAcc-XYZ  
  - tBodyAccJerk-XYZ  
  - tBodyGyro-XYZ  
  - tBodyGyroJerk-XYZ  
  - tBodyAccMag  
  - tGravityAccMag  
  - tBodyAccJerkMag  
  - tBodyGyroMag  
  - tBodyGyroJerkMag  
  - fBodyAcc-XYZ  
  - fBodyAccJerk-XYZ  
  - fBodyGyro-XYZ  
  - fBodyAccMag  
  - fBodyAccJerkMag  
  - fBodyGyroMag  
  - fBodyGyroJerkMag

## Variables

For each signal, the following variables were estimated:

  - mean(): Mean value  
  - std(): Standard deviation  
  - mad(): Median absolute deviation  
  - max(): Largest value in array  
  - min(): Smallest value in array  
  - sma(): Signal magnitude area  
  - energy(): Energy measure. Sum of the squares divided by the number
    of values  
  - iqr(): Interquartile range  
  - entropy(): Signal entropy  
  - arCoeff(): Autorregresion coefficients with Burg order equal to 4  
  - correlation(): correlation coefficient between two signals  
  - maxInds(): index of the frequency component with largest magnitude  
  - meanFreq(): Weighted average of the frequency components to obtain a
    mean frequency  
  - skewness(): skewness of the frequency domain signal  
  - kurtosis(): kurtosis of the frequency domain signal  
  - bandsEnergy(): Energy of a frequency interval within the 64 bins of
    the FFT of each window  
  - angle(): Angle between to vectors

Additional vectors were obtained averaging the signals and were stored
in the angle() variable:

  - gravityMean  
  - tBodyAccMean  
  - tBodyAccJerkMean  
  - tBodyGyroMean  
  - tBodyGyroJerkMean
