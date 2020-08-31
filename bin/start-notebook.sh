#!/bin/bash

set -e

wrapper=""
if [[ "${RESTARTABLE}" == "yes" ]]; then
    wrapper="run-one-constantly"
fi

echo "SPARK_SUBMIT_OPTS: ${SPARK_SUBMIT_OPTS}"
#echo "PYSPARK_SUBMIT_ARGS: ${PYSPARK_SUBMIT_ARGS}"
if [[ ! -z "${JUPYTERHUB_API_TOKEN}" ]]; then
    # launched by JupyterHub, use single-user entrypoint
    exec /usr/local/bin/start-singleuser-pyspark-notebook.sh "$@"
elif [[ ! -z "${JUPYTER_ENABLE_LAB}" ]]; then
    export PYSPARK_DRIVER_PYTHON_OPTS="lab $@"
    . /usr/local/bin/start.sh $wrapper pyspark ${SPARK_SUBMIT_OPTS}
else
    export PYSPARK_DRIVER_PYTHON_OPTS="notebook $@"
    . /usr/local/bin/start.sh $wrapper pyspark ${SPARK_SUBMIT_OPTS}
fi
