import random

# man data:
men_names = [
    "Андрей",
    "Александр",
    "Сергей",
    "Валерий",
    "Дмитрий",
    "Павел",
    "Юрий"
]

men_surnames = [
    "Пашенцев",
    "Дмитриев",
    "Фролов",
    "Кузьмин",
    "Ковалёв",
    "Антонов",
    "Жмышенко"
]

men_pathronimics = [
    "Сергеевич",
    "Андреевич",
    "Валерьевич",
    "Петрович",
    "Александрович",
    "Альбертович"
]

# wooman data:
wooman_names = [
    "Светлана",
    "Сауле",
    "Мария",
    "Дарья",
    "Елена",
    "Алина"
]

wooman_surnames = [
    "Белова",
    "Захарова",
    "Тарасова",
    "Жукова",
    "Фомина",
    "Абрамова",
    "Жмышенко"
]

wooman_pathronimics = [
    "Сергеевна",
    "Константиновна",
    "Петровна",
    "Павловна",
    "Валерьевна",
    "Александровна"
]

statements = ["INSERT INTO ", " VALUES "]
table_names = ["Students", "Groups", "Teachers"]
fields = ["(student_name, student_surname, student_pathronimic)"]


def generate_insert_students_query(count: int, table_name: str):
    # generate men
    man_count = count // 2
    wooman_count = count - man_count

    for i in range(man_count):
        name = random.choice(men_names)
        surname = random.choice(men_surnames)
        pathronimic = random.choice(men_pathronimics)

        query = statements[0] + table_name + " " + fields[0] + \
        statements[1] + " (" + name + "," + surname + "," + pathronimic + ");"

        print(query)
    
    for i in range(wooman_count):
        name = random.choice(wooman_names)
        surname = random.choice(wooman_surnames)
        pathronimic = random.choice(wooman_pathronimics)

        query = statements[0] + table_name + " " + fields[0] + \
        statements[1] + " (" + name + ", " + surname + ", " + pathronimic + ");"

        print(query)


def main():
    print("enter the table name:")

    query_name = input()

    if query_name == table_names[0]:
        print("enter the count of items:")

        try:
            count = int(input())
        except:
            assert False
        
        generate_insert_students_query(count, table_names[0])



if __name__ == '__main__':
    main()

