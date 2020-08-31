#!/bin/bash

export PYSPARK_PYTHON="${CONDA_DIR}/bin/python"
export PYSPARK_DRIVER_PYTHON="${CONDA_DIR}/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --NotebookApp.open_browser=False --NotebookApp.ip='*'"

/usr/local/spark/pyspark "$@"
