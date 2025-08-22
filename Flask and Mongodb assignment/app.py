from flask import Flask, jsonify, request, render_template
import json
from dotenv import load_dotenv
import os
import pymongo

load_dotenv()
MONGO_URI=os.getenv('MONGO_URI')

client=pymongo.MongoClient(MONGO_URI)
db=client.clientsDB     
collection=db['flask-tutorial']


app=Flask(__name__)


# solution for 2nd question...server form on homepage...redirect to /success upon successful form submission
@app.route("/")
def home():
    return render_template('index.html',form={},error=None)

@app.route("/success",methods=["POST"])
def submit():
    form_data=dict(request.form)
    
    # if passwords mismatch, re-render form with error
    if form_data.get("password") != form_data.get("cnfpassword"):
        return render_template("index.html", form=form_data, error="Passwords do not match")
    collection.insert_one(form_data)              #arg must be python dictionary
    
    return render_template('success.html')





#solution for 1st question
@app.route("/api", methods=["GET"])
def get_data():
    # Read from JSON file
    with open("data.json", "r") as f:
        data = json.load(f)
    return jsonify(data)


if __name__=='__main__':
    app.run(debug=True)