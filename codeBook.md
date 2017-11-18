# Code book for *Getting and Cleaning Data* course project

The data set that this code book pertains to is located in the `tidyData.txt` file of this repository.

See the `README.md` file of this repository for background information on this data set.

The structure of the data set is described in the [Data](#data) section, its variables are listed in the [Variables](#variables) section, and the transformations that were carried out to obtain the data set based on the source data are presented in the [Transformations](#transformations) section.

## Data <a name=`data`></a>

The `tidyData.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables.

## Variables <a name=`variables`></a>

Each row contains, for a given subject and activity, 68 averaged signal measurements.

### Identifiers <a name=`identifiers`></a>

- `Subject`

	Subject identifier, integer, ranges from 1 to 30.

- `Activity`

	Activity identifier, string with 6 possible values:
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements <a name=`average-measurements`></a>

All measurements are floating-point values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.

The measurements are classified in two domains:

- Time-domain signals (variables containing `TimeSignal`), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables containing `FrequencySignal`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

##### Time-domain signals

- Average time-domain body acceleration in the X, Y and Z directions:

	- `BodyAccelerometerTimeSignalMean-X`
	- `BodyAccelerometerTimeSignalMean-Y`
	- `BodyAccelerometerTimeSignalMean-Z`

- Standard deviation of the time-domain body acceleration in the X, Y and Z directions:

	- `BodyAccelerometerTimeSignalStdDev-X`
	- `BodyAccelerometerTimeSignalStdDev-Y`
	- `BodyAccelerometerTimeSignalStdDev-Z`

- Average time-domain gravity acceleration in the X, Y and Z directions:

	- `GravityAccelerometerTimeSignalMean-X`
	- `GravityAccelerometerTimeSignalMean-Y`
	- `GravityAccelerometerTimeSignalMean-Z`

- Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:

	- `GravityAccelerometerTimeSignalStdDev-X`
	- `GravityAccelerometerTimeSignalStdDev-Y`
	- `GravityAccelerometerTimeSignalStdDev-Z`


- Average and standard deviation of the time-domain magnitude of gravity acceleration:

	- `GravityAccelerometerMagnitudeTimeSignalMean`
	- `GravityAccelerometerMagnitudeTimeSignalStdDev`


- Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `BodyAccelerometerJerkTimeSignalMean-X`
	- `BodyAccelerometerJerkTimeSignalMean-Y`
	- `BodyAccelerometerJerkTimeSignalMean-Z`

- Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `BodyAccelerometerJerkTimeSignalStdDev-X`
	- `BodyAccelerometerJerkTimeSignalStdDev-Y`
	- `BodyAccelerometerJerkTimeSignalStdDev-Z`

- Average time-domain body angular velocity in the X, Y and Z directions:

	- `BodyGyroscopeTimeSignalMean-X`
	- `BodyGyroscopeTimeSignalMean-Y`
	- `BodyGyroscopeTimeSignalMean-Z`

- Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:

	- `BodyGyroscopeTimeSignalStdDev-X`
	- `BodyGyroscopeTimeSignalStdDev-Y`
	- `BodyGyroscopeTimeSignalStdDev-Z`


- Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `BodyGyroscopeJerkTimeSignalMean-X`
	- `BodyGyroscopeJerkTimeSignalMean-Y`
	- `BodyGyroscopeJerkTimeSignalMean-Z`


- Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `BodyGyroscopeJerkTimeSignalStdDev-X`
	- `BodyGyroscopeJerkTimeSignalStdDev-Y`
	- `BodyGyroscopeJerkTimeSignalStdDev-Z`


- Average and standard deviation of the time-domain magnitude of body acceleration:

	- `BodyAccelerometerMagnitudeTimeSignalMean`
	- `BodyAccelerometerMagnitudeTimeSignalStdDev`

- Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `BodyAccelerometerJerkMagnitudeTimeSignalMean`
	- `BodyAccelerometerJerkMagnitudeTimeSignalStdDev`


- Average and standard deviation of the time-domain magnitude of body angular velocity:

	- `BodyGyroscopeMagnitudeTimeSignalMean`
	- `BodyGyroscopeMagnitudeTimeSignalStdDev`

- Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `BodyGyroscopeJerkMagnitudeTimeSignalMean`
	- `BodyGyroscopeJerkMagnitudeTimeSignalStdDev`



##### Frequency-domain signals

- Average frequency-domain body acceleration in the X, Y and Z directions:

	- `BodyAccelerometerFrequencySignalMean-X`
	- `BodyAccelerometerFrequencySignalMean-Y`
	- `BodyAccelerometerFrequencySignalMean-Z`

- Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions:

	- `BodyAccelerometerFrequencySignalStdDev-X`
	- `BodyAccelerometerFrequencySignalStdDev-Y`
	- `BodyAccelerometerFrequencySignalStdDev-Z`

- Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `BodyAccelerometerJerkFrequencySignalMean-X`
	- `BodyAccelerometerJerkFrequencySignalMean-Y`
	- `BodyAccelerometerJerkFrequencySignalMean-Z`

- Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `BodyAccelerometerJerkFrequencySignalStdDev-X`
	- `BodyAccelerometerJerkFrequencySignalStdDev-Y`
	- `BodyAccelerometerJerkFrequencySignalStdDev-Z`

- Average frequency-domain body angular velocity in the X, Y and Z directions:

	- `BodyGyroscopeFrequencySignalMean-X`
	- `BodyGyroscopeFrequencySignalMean-Y`
	- `BodyGyroscopeFrequencySignalMean-Z`

- Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions:

	- `BodyGyroscopeFrequencySignalStdDev-X`
	- `BodyGyroscopeFrequencySignalStdDev-Y`
	- `BodyGyroscopeFrequencySignalStdDev-Z`

- Average and standard deviation of the frequency components of the frequency-domain magnitude of body acceleration:

	- `BodyAccelerometerMagnitudeFrequencySignalMean`
	- `BodyAccelerometerMagnitudeFrequencySignalStdDev`

- Average and standard deviation of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `BodyAccelerometerJerkMagnitudeFrequencySignalMean`
	- `BodyAccelerometerJerkMagnitudeFrequencySignalStdDev`


- Average and standard deviation of the frequency components of the frequency-domain magnitude of body angular velocity:

	- `BodyGyroscopeMagnitudeFrequencySignalMean`
	- `BodyGyroscopeMagnitudeFrequencySignalStdDev`

- Average and standard deviation of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `BodyGyroscopeJerkMagnitudeFrequencySignalMean`
	- `BodyGyroscopeJerkMagnitudeFrequencySignalStdDev`


## Transformations <a name=`transformations`></a>

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.
2. The measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) were extracted for each measurement, and the others were discarded.
3. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see [Identifiers](#identifiers) section).
4. The variable names were replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` was expanded to `BodyAccelerometerTimeSignalMean-X`), using the following set of rules:
	- The prefacing numbers were removed
	- The initial `f` and `t` were expanded to `FrequencySignal` and `TimeSignal` respectively, and moved to the end of the string
	- `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `StdDev` respectively.  Also removed irrelevant special characters i.e `(`, `)` and the first `-`. The second `-` was left for readability purposes.
 	- Fixed the `BodyBody` typo as supplied by the features.txt file by replacing it with `Body`.
	5. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the `run_analysis.R` R script (see `README.md` file for usage instructions).
