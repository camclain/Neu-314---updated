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
