import marimo

__generated_with = "0.11.30"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    import json
    from transformers import AutoModel, AutoTokenizer
    return AutoModel, AutoTokenizer, json, mo


@app.cell
def _(json):
    with open("./LaMP/LaMP-4/train_questions.json") as file:
        data = json.load(file)
    return data, file


@app.cell
def _():
    def extract_after_article(input_string):
        article_index = input_string.find('article:')
        if article_index == -1:
            return None
        return input_string[article_index + len('article:'):].strip()

    def generation_news_query_corpus_maker(inp, profile, use_date):
        if use_date:
            corpus = [f'{x["title"]} {x["text"]} date: {x["date"]}' for x in profile]
        else:
            corpus = [f'{x["title"]} {x["text"]}' for x in profile]
        ids = [x['id'] for x in profile]
        query = extract_after_article(inp)
        return corpus, query, ids
    return extract_after_article, generation_news_query_corpus_maker


@app.cell
def _(AutoModel, AutoTokenizer, data, generation_news_query_corpus_maker):
    contriever_checkpoint = "facebook/contriever"
    tokenizer = AutoTokenizer.from_pretrained(contriever_checkpoint)
    contriver = AutoModel.from_pretrained(contriever_checkpoint)
    contriver.eval()
    for d in data:
        inp = d['input']
        profile = d['profile']
        courpus, query, ids = generation_news_query_corpus_maker(inp, profile, 'store_true')
    return (
        contriever_checkpoint,
        contriver,
        courpus,
        d,
        ids,
        inp,
        profile,
        query,
        tokenizer,
    )


@app.cell
def _(courpus):
    courpus
    return


@app.cell
def _(data):
    data[0]
    return


@app.cell
def _(inp):
    inp
    return


@app.cell
def _(query):
    query
    return


@app.cell
def _(ids):
    ids
    return


@app.cell
def _():
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
