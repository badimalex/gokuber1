package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/lib/pq"
)

func main() {
	dbUser := os.Getenv("POSTGRES_USER")
	dbPassword := os.Getenv("POSTGRES_PASSWORD")
	dbName := os.Getenv("POSTGRES_DB")
	dbHost := "postgres-service"
	dbPort := "5432"

	connectionString := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable", dbUser, dbPassword, dbHost, dbPort, dbName)

	db, err := sql.Open("postgres", connectionString)
	if err != nil {
		log.Fatal(err)
	}
	if err = db.Ping(); err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var name string
		err := db.QueryRow("SELECT name FROM test LIMIT 1").Scan(&name)
		if err != nil {
			fmt.Println(dbUser)
			fmt.Println(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		w.Write([]byte(fmt.Sprintf("Hello, %s", name)))
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}

// docker build -t golang-rest-api .
// docker tag golang-rest-api gcr.io/dulcet-elevator-407117/golang-rest-api
// docker push gcr.io/dulcet-elevator-407117/golang-rest-api
// psql -U [username] -d yourdbname
// kubectl cp db.sql postgres-b8df98899-r76n9:/tmp/db.sql
// psql -U yourusername -d test < /tmp/db.sql
// kubectl create secret generic postgres-secret --from-literal=db=test --from-literal=user=yourusername --from-literal=password=yourpassword
