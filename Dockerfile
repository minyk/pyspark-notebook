FROM  jupyter/pyspark-notebook:latest

USER root

# Install koalas
RUN conda install -c conda-forge --quiet -y 'koalas' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

COPY bin/start-notebook.sh bin/start-singleuser-pyspark-notebook.sh /usr/local/bin/
COPY --chown=jovyan:users ipykernel/kernelspec-python3.json /opt/conda/share/jupyter/kernels/python3/kernel.json
COPY --chown=jovyan:users ipykernel/kernelconfig-python3.json /opt/conda/share/jupyter/kernels/python3/config.json
COPY spark/conf/spark-defaults.conf /usr/local/spark/conf/spark-defaults.conf

USER $NB_UID

# Configure pyspark
ENV PYSPARK_PYTHON="${CONDA_DIR}/bin/python" \
    PYSPARK_DRIVER_PYTHON="${CONDA_DIR}/bin/jupyter"
