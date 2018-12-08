# Docker file for DSCI_522_Alberta-Oil-Spills
# Alycia Butterworth, Dec. 6, 2018
# Adapted from a Dockerfile by Tiffany Timbers
#
# Using docker, this file creates an environment called `alyciakb/dsci_522_alberta-oil-spills`
# The environment includes correct versions of all dependencies required
# to reproduce the DSCI_522_Alberta-Oil-Spills in its entirety
#
# Usage: 
# Build the docker image:
# docker build --tag dsci_522_alberta-oil-spills:0.1 .
# Create the environment and run the makefile to reproduce analysis:
# `docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/alberta_oil_spills alyciakb/dsci_522_alberta-oil-spills make -C '/home/alberta_oil_spills' all`
#
# Remove files created by running the analysis:
# `docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/alberta_oil_spills alyciakb/dsci_522_alberta-oil-spills make -C '/home/alberta_oil_spills' clean`


# use rocker/tidyverse as the base image
FROM rocker/tidyverse:3.3.1

# then install the cowsay package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    cowsay

# install python 3
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# get python package dependencies
RUN apt-get install -y python3-tk

# install required python packages
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install seaborn
RUN pip3 install scikit-learn
RUN pip3 install graphviz \
  && apt-get install -y graphviz libgraphviz-dev
RUN pip3 install matplotlib

# install R packages
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('gridExtra')"

# clone, build makefile2graph
# and copy key makefile2graph files to usr/bin
RUN git clone https://github.com/lindenb/makefile2graph.git
RUN make -C makefile2graph/.
RUN cp makefile2graph/makefile2graph usr/bin
RUN cp makefile2graph/make2graph usr/bin
