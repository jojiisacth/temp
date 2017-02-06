package main

import (
    "fmt"
     "github.com/gorilla/mux"
    "net/http"
    "log"
)

func main() {

    router := mux.NewRouter()
    router.HandleFunc("/", HomeHandler)
    router.HandleFunc("/products", ProductsHandler)
    router.HandleFunc("/articles", ArticlesHandler)
    

    log.Fatal(http.ListenAndServe(":8081", router))

}


func HomeHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "wellcome to home page: %v\n", vars["category"])
}

func ProductsHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "Your products: %v\n", vars["category"])
}

func ArticlesHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "YOur articles: %v\n", vars["category"])
}