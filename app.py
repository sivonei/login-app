from flask import Flask, render_template, request, redirect

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user = request.form['username']
        pwd = request.form['password']
        if user == 'admin' and pwd == 'admin':
            return 'Login Successful'
        else:
            return 'Invalid Credentials'
    return render_template('login.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
