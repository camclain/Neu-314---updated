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
