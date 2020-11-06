FROM  jupyter/pyspark-notebook:latest

USER $NB_UID

# Install koalas
RUN conda install -c conda-forge --quiet -y 'koalas' 'jupyter-server-proxy' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    jupyter labextension install @jupyterlab/server-proxy --minimize=False
RUN pip install git+git://github.com/aolwas/jupyter-sparkui-proxy
#    /opt/conda/bin/pip install --no-dependencies jupyterlab-sparkmonitor && \
#    /opt/conda/bin/pip install bs4 tornado
#    jupyter labextension install --clean --minimize=False jupyterlab_sparkmonitor && \
#    jupyter serverextension enable --py sparkmonitor

USER root

COPY --chown=jovyan:users ipykernel/pyspark3 /opt/conda/share/jupyter/kernels/pyspark3
COPY spark/conf/spark-defaults.conf /usr/local/spark/conf/spark-defaults.conf
#COPY spark/lib/listener.jar /usr/local/spark/jars/sparkmonitor-listener.jar

USER $NB_UID
