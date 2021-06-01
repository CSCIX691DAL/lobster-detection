lobster-pictures
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
helpful in getting
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

``` r
library(tidyr)
library(ggplot2)
```

### Preprocess the data

``` r
image_1 <- as.data.frame(train_images[1, , ])
colnames(image_1) <- seq_len(ncol(image_1))
image_1$y <- seq_len(nrow(image_1))
image_1 <- gather(image_1, "x", "value", -y)
image_1$x <- as.integer(image_1$x)

ggplot(image_1, aes(x = x, y = y, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black", na.value = NA) +
  scale_y_reverse() +
  theme_minimal() +
  theme(panel.grid = element_blank())   +
  theme(aspect.ratio = 1) +
  xlab("") +
  ylab("")
```

![](lobster-pictures_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
train_images <- train_images / 255
test_images <- test_images / 255
```

``` r
par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:25) { 
  img <- train_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste(class_names[train_labels[i] + 1]))
}
```

![](lobster-pictures_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

### Build the model

``` r
model <- keras_model_sequential()
model %>%
  layer_flatten(input_shape = c(28, 28)) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')
```

### Compile the model

``` r
model %>% compile(
  optimizer = 'adam', 
  loss = 'sparse_categorical_crossentropy',
  metrics = c('accuracy')
)
```

### Train the model

``` r
model %>% fit(train_images, train_labels, epochs = 5, verbose = 2)
```

``` r
score <- model %>% evaluate(test_images, test_labels, verbose = 0)

cat('Test loss:', score[c("loss")], "\n")
```

    ## Test loss: 0.3355981

``` r
cat('Test accuracy:', score[c("acc")], "\n")
```

    ## Test accuracy: NA

``` r
predictions <- model %>% predict(test_images)
```

``` r
predictions[1, ]
```

    ##  [1] 1.921148e-05 1.218960e-06 3.723019e-06 3.069497e-07 2.222001e-05
    ##  [6] 1.781892e-02 2.808457e-05 1.331318e-01 3.664232e-04 8.486081e-01

``` r
par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:25) { 
  img <- test_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  # subtract 1 as labels go from 0 to 9
  predicted_label <- which.max(predictions[i, ]) - 1
  true_label <- test_labels[i]
  if (predicted_label == true_label) {
    color <- '#008800' 
  } else {
    color <- '#bb0000'
  }
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste0(class_names[predicted_label + 1], " (",
                      class_names[true_label + 1], ")"),
        col.main = color)
}
```

![](lobster-pictures_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

``` r
# Grab an image from the test dataset
# take care to keep the batch dimension, as this is expected by the model
img <- test_images[1, , , drop = FALSE]
dim(img)
```

    ## [1]  1 28 28

``` r
predictions <- model %>% predict(img)
predictions
```

    ##              [,1]         [,2]         [,3]         [,4]         [,5]      [,6]
    ## [1,] 1.921146e-05 1.218959e-06 3.723016e-06 3.069491e-07 2.221999e-05 0.0178189
    ##              [,7]      [,8]        [,9]     [,10]
    ## [1,] 2.808454e-05 0.1331318 0.000366423 0.8486081

``` r
# subtract 1 as labels are 0-based
prediction <- predictions[1, ] - 1
which.max(prediction)
```

    ## [1] 10

``` r
class_pred <- model %>% predict_classes(img)
class_pred
```

    ## [1] 9
