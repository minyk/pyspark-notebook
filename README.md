pyspark-notebook
================

Use `jupyter/pyspark-noteook` in a spark-native manner.

# Changes from [Jupyter pyspark-notebook](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook)

* Use `pyspark` to start jupyter notebook
  * Using `SPARK_SUBMIT_OPTS`, instead of `SPARK_OPTS`
  * Pre-configured configs: See `spark/conf/spark-defaults.conf`

* Pre-installed [koalas](https://github.com/databricks/koalas) package

* Change the kernel spec
  * display name is now `pyspark 3.0.0`

* IPyKernel Configuration
  * Add links to help menu
    * pyspark, http://spark.apache.org/docs/latest/api/python/index.html
    * koalas, https://koalas.readthedocs.io/en/latest/
