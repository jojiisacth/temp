package main

import (
    "fmt"
     "github.com/gorilla/mux"
    "net/http"
    "log"
)

func main() {

    fmt.Println("hi Go")
    router := mux.NewRouter()
    router.HandleFunc("/", HomeHandler)
    router.HandleFunc("/products", ProductsHandler)
    router.HandleFunc("/articles", ArticlesHandler)
    fmt.Println("starting server")
     fmt.Println("starting server check   curl http://localhost:8081")
    log.Fatal(http.ListenAndServe(":8081", router))
     fmt.Println("closing api")
}


func HomeHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "wellcome to home page: %v\n", vars["category"])
    fmt.Println("serving home")
}

func ProductsHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "Your products: %v\n", vars["category"])
    fmt.Println("serving article")
}

func ArticlesHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "YOur articles: %v\n", vars["category"])
    fmt.Println("serving article")
}