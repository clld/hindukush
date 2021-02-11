def test_home(app):
    app.get_html('/', status=200)
    app.get_html('/parameters/CS01b', status=200)
    app.get_dt('/values?parameter=CS01b', status=200)
