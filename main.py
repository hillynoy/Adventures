from bottle import route, run, template, static_file, request
import json
import pymysql


@route("/", method="GET")
def index():
    return template("adventure.html")


connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='adventure',
                             cursorclass=pymysql.cursors.DictCursor)


def getQuestion(qid):
    try:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM questions WHERE id={}".format(qid)
            cursor.execute(sql)
            question = cursor.fetchone()
            print(question)

            print("I am here " + str(question))

            print(question['image'])

            sql_options = "SELECT * FROM options WHERE question_id= {}".format(qid)
            cursor.execute(sql_options)
            options = cursor.fetchall()

            print("I am here " + str(options))

            return {"current": qid, "text": question['question'], "image": str(question['image']), "options": options}

    except Exception as e:
        print("I got error " + repr(e))


def getUserByName(userName):
    try:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM users WHERE name = '{}'".format(userName)
            cursor.execute(sql)
            user = cursor.fetchone()
            return user
    except Exception as e:
        print("I got error " + repr(e))


def createANewUser(username, current_question_id, money, life):
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO users (name, last_current_question,money,life) VALUES (%s, %s,%s,%s)"
            cursor.execute(sql, (username, current_question_id, money, life))
            connection.commit()
    except Exception as e:
        print("I got error " + repr(e))


@route("/start", method="POST")
def start():
    username = request.POST.get("name")
    current_adv_id = request.POST.get("adventure_id")
    current_adv_id = 1
    user = getUserByName(username)
    if user:
        questionId = user['last_current_question']
        print(questionId)
    else:
        questionId = 0
        money = 50
        life = 100
        createANewUser(username, questionId, money, life)
        user = getUserByName(username)

    result = getQuestion(questionId)
    result["user"] = user['id']
    result["adventure"] = current_adv_id
    return json.dumps(result)

    connection.close


@route("/story", method="POST")
def story():
    user_id = request.POST.get("user")
    current_adv_id = request.POST.get("adventure")
    next_question = request.POST.get("next")
    opt_id = request.POST.get("opt_id")
    print("Show me that" + str(next_question))

    with connection.cursor() as cursor:
        sql2 = "UPDATE users SET last_current_question={} WHERE id={}".format(next_question, user_id)
        cursor.execute(sql2)
        connection.commit()

        sql = "SELECT image FROM questions WHERE id ={}".format(next_question)
        cursor.execute(sql)
        image_story = cursor.fetchone()

        question = "SELECT q.question FROM questions q LEFT JOIN options o ON q.id=o.target_question WHERE q.id={}".format(
            next_question)
        cursor.execute(question)
        questiontext = cursor.fetchone()

        # bubu = "SELECT opt_text FROM options WHERE question_id =(SELECT id FROM questions WHERE id={})".format(user_id)
        bubu = "SELECT * FROM options WHERE question_id=(SELECT id  FROM questions WHERE id={})".format(next_question)
        cursor.execute(bubu)
        next_steps_results_bubu = cursor.fetchall()

        print(next_steps_results_bubu)

        user_sql = "Select * from users where id={}".format(user_id)
        cursor.execute(user_sql)
        user = cursor.fetchone()

        option_sql = "select * from options where id={}".format(opt_id)
        cursor.execute(option_sql)
        option = cursor.fetchone()

        life_update = int(user['life']) + int(option['change_life'])
        money_update = int(user['money']) + int(option['change_money'])

        user_update = "Update users set money = {} , life={} , last_current_question={} where id={}".format(
            life_update, money_update, next_question, user_id)
        cursor.execute(user_update)
        connection.commit()

        # todo add the next step based on db
    return json.dumps({"user": user_id,
                       "adventure": current_adv_id,
                       "text": questiontext['question'],
                       "image": image_story['image'],
                       "options": next_steps_results_bubu,
                       "life": life_update,
                       "money": money_update
                       # "question_id": next_question
                       })


@route('/js/<filename:re:.*\.js$>', method='GET')
def javascripts(filename):
    return static_file(filename, root='js')


@route('/css/<filename:re:.*\.css>', method='GET')
def stylesheets(filename):
    return static_file(filename, root='css')


@route('/images/<filename:re:.*\.(jpg|png|gif|ico)>', method='GET')
def images(filename):
    return static_file(filename, root='images')


def main():
    run(host='localhost', port=9000)
    # run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))


if __name__ == '__main__':
    main()
