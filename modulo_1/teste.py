
import findspark
findspark.init()
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

path = '/home/data-enginner/xp_bootcamps/cloud_engenheiro/engenheiro_dado_cloud_igti/results.csv'
df = spark\
    .read\
    .option('header',True)\
    .option('inferSchema',True)\
    .csv(path)

df.printSchema()

from pyspark.sql.functions import col,substring
 

df = df.withColumn('year', substring(col("date"),0,4))

df = df.drop('date')

df.write\
    .option('header',True)\
    .mode('overwrite')\
    .parquet('/home/data-enginner/xp_bootcamps/cloud_engenheiro/engenheiro_dado_cloud_igti/modulo_1/table_parquet/soccer/')