import sqlite3
from sqlite3 import Error


def create_connection(db_file):
    """ create a database connection to the SQLite database
        specified by db_file
    :param db_file: database file
    :return: Connection object or None
    """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)

    return conn


def create_stocks(conn, stock):
    """
    Create a new stock into the stocks table
    :param conn:
    :param stock:
    :return:
    """
    sql = ''' INSERT INTO stocks(meal1,stock1,id)
              VALUES(?,?,?) '''
    cur = conn.cursor()
    cur.execute(sql, stock)
    conn.commit()
    return cur.lastrowid

def create_meals(conn, meal):
    """
    Create a new meal
    :param conn:
    :param meal:
    :return:
    """

    sql = ''' INSERT INTO meals(id, food, drink, seat, ordered)
              VALUES(?,?,?,?,?) '''
    cur = conn.cursor()
    cur.execute(sql, meal)
    conn.commit()
    return cur.lastrowid


def main():
    database = r"database.db"

    # create a database connection
    conn = create_connection(database)
    with conn:
        # create a new project
        stock_1 = ('chicken', 30, 1)
        stock_2 = ('fish', 30, 2)
        stock_3 = ('vegetarian', 30, 3)

        create_stocks(conn, stock_1)
        create_stocks(conn, stock_2)
        create_stocks(conn, stock_3)

        # tasks
        meal_1 = (1,'NA', 'NA', '32C', "Not Ordered")
        meal_2 = (2,'NA', 'NA', '36C', "Not Ordered")

    
        # create tasks
        create_meals(conn, meal_1)
        create_meals(conn, meal_2)


if __name__ == '__main__':
    main()