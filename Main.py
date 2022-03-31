import flask
import os

HTTP_PORT = os.getenv("PORT")
HTTP_PORT = HTTP_PORT if HTTP_PORT != None else "8080"

app = flask.Flask("DUMMY")
app.config["DEBUG"] = True

@app.route("/", methods=["GET"])
def get():
    name = flask.request.args["name"]
    return flask.jsonify({"name": name})

@app.route("/",  methods=["POST"])
def post_json():
    print(flask.request.get_json()["name"])
    return flask.Response(status=418)

@app.route("/params",  methods=["POST"])
def post_params():
    print(flask.request.form["name"])
    return flask.Response(status=200)

# app.run(port=HTTP_PORT)
