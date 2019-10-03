# VERSION CONTROL AND IMAGE MANIPULATION
# Question A

# part a

using JLD
using PyPlot

# to show the original image

image = imread("el-capitan.png")
imshow(image)
size(image)

# part b
# write a function that takes as input a string representing the filename, and
# then loads the image file, displays it, and extracts the red, blue, and green
# channels into separate variables, and returns those variables.

"""
extractRGB(String)

Given the file name of an image (in a String), this returns a matrix of the
R, G and B components of that image.

= PARAMETERS:

- String        filename of an image

= RETURNS:

- [R,G,B], a 3D matrix in which the first index is the red component, the second
index is the green component and the third index is the blue component.

"""

function extractRGB(String)
    image = imread(String)
    imshow(image)
    R = image[:,:,1]
    G = image[:,:,2]
    B = image[:,:,3]
    return [R, G, B]
end

println("Reset with git reset -- mixed")

## part e
# create a new image in which the color channels are swapped from the original,
# so that image2 relates to the originial as: G = R, B = G and R = B

image2 = zeros(360, 640, 3)
image2[:,:,1] = extractRGB("el-capitan.png")[2]
image2[:,:,2] = extractRGB("el-capitan.png")[3]
image2[:,:,3] = extractRGB("el-capitan.png")[1]

# display the two images side by side

subplot(1,2,1)
imshow(image)
title("Original image")
axis("off")
subplot(1,2,2)
imshow(image2)
title("Image with inverted RGB values")
axis("off")

# Question B
# write a function that, for a given image, circularly moves only the red
# channel up p number of pixels

"""
circle_red_channel(String, int)

Given the file name of an image (as a String), and a number of pixels
(as an int), this returns a new image in which the red channel of the original
image is moved up the given number of pixels. It then displays both the original
and the new image.

= PARAMETERS:

- String        filename of an image
- int           given number of pixels

= RETURNS:

- image2, a new image with the red channel moved up from the original.

"""

function circle_red_channel(String, int)
           p = int
           image = imread(String)
           R = image[:,:,1]

           # create an empty matrix of size R, and fill it with the
           # corresponding rows in the original R, ensuring to loop around when
           # the row number is greater than 360

           newR = zeros(size(R))
           for i = 1:360
                   if (i + p) <= 360
                   newR[i+p, :] = R[i, :]
               elseif (i + p) > 360
                   newR[(i + p) - 360, :] = R[i, :]
               end
           end

           # copy the original image and input the new matrix for R

           image2 = copy(image)
           image2[:,:,1] = newR

           # plot both of the images side by side

           subplot(1,2,1)
           imshow(image)
           title("Original image")
           axis("off")
           subplot(1,2,2)
           imshow(image2)
           title("Image with shifted R values")
           axis("off")

           image2
end

# Question B
# write a function that, for a given image, circularly moves only the red
# channel up p number of pixels

"""
circle_red_channel(String, int)

Given the file name of an image (as a String), and a number of pixels
(as an int), this returns a new image in which the red channel of the original
image is moved up the given number of pixels. It then displays both the original
and the new image.

= PARAMETERS:

- String        filename of an image
- int           given number of pixels

= RETURNS:

- image2, a new image with the red channel moved up from the original.

"""

function circle_red_channel(String, int)
           p = int
           image = imread(String)
           R = image[:,:,1]

           # create an empty matrix of size R, and fill it with the
           # corresponding rows in the original R, ensuring to loop around when
           # the row number is greater than 360

           newR = zeros(size(R))
           for i = 1:360
                   if (i + p) <= 360
                   newR[i+p, :] = R[i, :]
               elseif (i + p) > 360
                   newR[(i + p) - 360, :] = R[i, :]
               end
           end

           # copy the original image and input the new matrix for R

           image2 = copy(image)
           image2[:,:,1] = newR

           # plot both of the images side by side

           subplot(1,2,1)
           imshow(image)
           title("Original image")
           axis("off")
           subplot(1,2,2)
           imshow(image2)
           title("Image with shifted R values")
           axis("off")

           image2
end
