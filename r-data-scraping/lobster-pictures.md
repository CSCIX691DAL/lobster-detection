Lobster Image Classification with TensorFlow and R
================

## Training a TensorFlow model with R

Based on the guide from [TensorFlow for R from R
Studio](https://tensorflow.rstudio.com/tutorials/beginners/basic-ml/tutorial_basic_classification/)

<https://github.com/rstudio/tensorflow>

> This guide uses the Fashion MNIST dataset which contains 70,000
> grayscale images in 10 categories. The images show individual articles
> of clothing at low resolution (28 by 28 pixels), as seen here:

### Installation and setup:

Install/Load the required packages:

``` r
#Uncomment the following line to include the installation of the keras package:
#install.packages("keras")
#install.packages("tensorflow")
```

Load the keras library in to the R session:

``` r
library(keras)
library(tensorflow)
```

``` r
#install_tensorflow()
```

You may need to install cuda and anacoda, these instructions from a
github user [CostanzoPablo](https://github.com/CostanzoPablo) were
helpful in getting I
tensorflow/stream\_executor/platform/default/dso\_loader /
cudart64\_110.dll to work on my machine:

> -   Uninstall all drivers that says “nvidia” from Uninstall programs
>     (ALL, Cuda and gpu driver)
> -   Install last nvidia drivers for your GPU
>     <https://uk.download.nvidia.com/GFE/GFEClient/3.21.0.36/GeForce_Experience_v3.21.0.36.exe>
> -   Install cuda 11.2
>     <https://developer.download.nvidia.com/compute/cuda/11.2.1/local_installers/cuda_11.2.1_461.09_win10.exe>
> -   Install Anaconda
>     <https://repo.anaconda.com/archive/Anaconda3-2020.11-Windows-x86_64.exe>
> -   conda create -n cudaenv python=3.6
> -   conda activate cudaenv
> -   pip install tensorflow python-dotenv
> -   Create a.py with this: import tensorflow as tf
> -   run it: python a.py
> -   Output: xxx: I
>     tensorflow/stream\_executor/platform/default/dso\_loader.cc:49\]
>     Successfully opened dynamic library cudart64\_110.dll

<https://github.com/tensorflow/tensorflow/issues/45055>

### Basic Example: Importing the Fashion MNIST dataset

> Fashion MNIST is intended as a drop-in replacement for the classic
> MNIST dataset—often used as the “Hello, World” of machine learning
> programs for computer vision. The MNIST dataset contains images of
> handwritten digits (0, 1, 2, etc) in an identical format to the
> articles of clothing we’ll use here. This guide uses Fashion MNIST for
> variety, and because it’s a slightly more challenging problem than
> regular MNIST. Both datasets are relatively small and are used to
> verify that an algorithm works as expected. They’re good starting
> points to test and debug code. We will use 60,000 images to train the
> network and 10,000 images to evaluate how accurately the network
> learned to classify images. You can access the Fashion MNIST directly
> from Keras.

``` r
fashion_mnist <- dataset_fashion_mnist()
```

``` r
c(train_images, train_labels) %<-% fashion_mnist$train
c(test_images, test_labels) %<-% fashion_mnist$test
```

``` r
class_names = c('T-shirt/top',
                'Trouser',
                'Pullover',
                'Dress',
                'Coat', 
                'Sandal',
                'Shirt',
                'Sneaker',
                'Bag',
                'Ankle boot')
```

``` r
dim(train_images)
```

    ## [1] 60000    28    28

``` r
dim(train_labels)
```

    ## [1] 60000

``` r
train_labels[1:20]
```

    ##  [1] 9 0 0 3 0 2 7 2 5 5 0 9 5 5 7 9 1 0 6 4

``` r
dim(test_images)
```

    ## [1] 10000    28    28

``` r
dim(test_labels)
```

    ## [1] 10000
