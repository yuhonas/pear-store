from typing import Union

from fastapi import FastAPI

import json

app = FastAPI()

# fake_items_db = [{"item_name": "Foo"}, {"item_name": "Bar"}, {"item_name": "Baz"}]
fake_items_db = json.load(open('./db/seeds/take-home-data-facet.json'))

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/products/")
async def read_item(skip: int = 0, limit: int = 10, q: Union[str, None] = None):
    return fake_items_db[skip : skip + limit]
