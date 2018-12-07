# Docker file for DSCI_522_Alberta-Oil-Spills
# Alycia Butterworth, Dec. 6, 2018
# Adapted from a Dockerfile by Tiffany Timbers

# use rocker/tidyverse as the base image and
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
RUN pip3 install argparse
RUN pip3 install scikit-learn
RUN pip3 install graphviz
RUN pip3 install matplotlib

# install R packages
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('gridExtra')"
