# Use the official Miniconda image from ContinuumIO as the base image
FROM continuumio/miniconda3:latest

# Update the OS
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

# Copy over environment.yml file
COPY environment.yml /tmp/environment.yml

# Create a conda environment
RUN conda update -n base -c defaults conda
RUN conda env create -f /tmp/environment.yml && \
    conda clean --all --yes

# Set conda environment as default
ENV PATH /opt/conda/envs/bactvar/bin:$PATH

# Set default command
CMD ["/bin/bash"]
