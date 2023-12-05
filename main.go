package main

import (
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello, World!"))
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

// docker tag golang-rest-api gcr.io/dulcet-elevator-407117/golang-rest-api
// docker push gcr.io/dulcet-elevator-407117/golang-rest-api
