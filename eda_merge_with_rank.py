import marimo

__generated_with = "0.11.30"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    import json
    return json, mo


@app.cell
def _(json):
    with open("LaMP/LaMP-4/dev_questions.json") as qf:
        inps = json.load(qf)
    with open("LaMP/LaMP-4/dev_outputs.json") as of:
        outs = json.load(of)
    with open("LaMP/LaMP-4/dev_questions_rank.json") as rf:
        ranks = json.load(rf)
    return inps, of, outs, qf, ranks, rf


@app.cell
def _(inps, outs, ranks):
    for inp in inps:
        for o in outs['golds']:
            if o["id"] == inp["id"]:
                output = o["output"]
                break
        new_profile = []
        for x in ranks[inp['id']]:
            for y in inp['profile']:
                if y['id'] == x:
                    new_profile.append(y)
                    break
    return inp, new_profile, o, output, x, y


@app.cell
def _(inps, ranks):
    ranks[inps[0]['id']]
    return


@app.cell
def _(inp):
    inp['profile'][0]
    return


if __name__ == "__main__":
    app.run()
