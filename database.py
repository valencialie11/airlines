import sqlite3
from sqlite3 import Error


def create_connection(db_file):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)
    return conn

def create_table(conn, create_table_sql):
    """ create a table from the create_table_sql statement
    :param conn: Connection object
    :param create_table_sql: a CREATE TABLE statement
    :return:
    """
    try:
        c = conn.cursor()
        c.execute(create_table_sql)
    except Error as e:
        print(e)


def main():
    database = r"database.db"

    sql_create_stocks_table = """ CREATE TABLE IF NOT EXISTS stocks (
                                        meal1 text NOT NULL,
                                        stock1 integer NOT NULL,
                                        id integer PRIMARY KEY
                                    ); """

    sql_create_meals_table = """CREATE TABLE IF NOT EXISTS meals (
                                    id integer PRIMARY KEY,
                                    food text NOT NULL,
                                    drink text NOT NULL,
                                    seat text NOT NULL,
                                    ordered text NOT NULL
                                );"""

    sql_create_feedback_table = """CREATE TABLE IF NOT EXISTS feedbacks (
                                    meal text PRIMARY KEY,
                                    feedback text NOT NULL
                                );"""

    # create a database connection
    conn = create_connection(database)

    if conn is not None:
        # create projects table
        create_table(conn, sql_create_stocks_table)

        # create tasks table
        create_table(conn, sql_create_meals_table)

        create_table(conn, sql_create_feedback_table)


    else:
        print("Error! cannot create the database connection.")


if __name__ == '__main__':
    main()