# A simple VirtualCube for Mondrian v3

Some people are frequently asking around how to use Virtual Cubes, so I've setup this simple example to demonstrate a working prototype.

## Pre-requisites

* **Pentaho Data Integration** - preferably 6+
* **Running Pentaho BA Server** - preferably 6+
* **PostgreSQL** - DDL provided for this database, but others will work when adapted.

## Running it yourself

1. Run the script `data/schema.postgres.sql` on your PostgreSQL;
  * Or adapt this script for your DBMS and run - pull requests for other databases are welcome.
2. Open the transformation `support-etl/load_data_into_db.ktr`
3. Change the connection settings according to the settings of your DBMS (host, port, database, usernrame, password);
4. Run the transformation;
5. Create a connection within your BA Server (**File > Manage Datasources > cogwheel-icon > New Connection**) if non-existent;
  * Make sure that the JDBC Driver for your DBMS exists into `tomcat/lib`
6. On **File > Manage Datasources**, click the cogwheel icon and choose **Import Analysis**;
7. On **Mondrian File**, click the `[...]` icon to locate the file `schema/OncaseVirtualCubeExample.xml` that is stored in your computer;
8. Choose the DataSource that points to the DBMS that you're using for this example.
9. Click Import;

From now on, you should see three cubes available in your OLAP players:
 * Vendas
 * Compras
 * Vendas x Compras

**Vendas x Compras** is a virtual cube that combines informations from both cubes, Vendas and Compras.

All the dimensions used in this virtual cube are present in both cubes; I kept it simple for learning purposes.

If planned to add dimensions that are not present in both cubes, you should:
 1. On the virtual cube, hide the measures from the cube that doesn't have all the dimensions
 2. Make use of these hide measures into calculated members attached to the VirtualCube like so:
 ```
ValidMeasure ([Measures].[My hidden measure])
 ```

This formula will make your measure (that one that doesn't have all the dimensions) always visible by forcing the non existent dimension to its toplevel into the tuple in which it's contained.

 But use it carefully: http://jira.pentaho.com/browse/MONDRIAN-2280
