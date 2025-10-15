from opentelemetry.instrumentation.auto_instrumentation import initialize
initialize()

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "Hello World again with modules!"}

@app.get("/hello/{name}")
async def read_item(name: str):
    return {"message": f"Hello {name}"}