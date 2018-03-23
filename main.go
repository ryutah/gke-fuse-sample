package main

import (
	"bufio"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

func main() {
	http.HandleFunc("/", printFiles)
	log.Println(http.ListenAndServe(":8080", nil))
}

func printFiles(w http.ResponseWriter, r *http.Request) {
	bkt := os.Getenv("GCS_BUCKET_NAME")
	mntDir := filepath.Join("/", "mnt", "gcs", bkt)
	log.Printf("Directory : %v\n", mntDir)
	dir, err := ioutil.ReadDir(mntDir)
	if err != nil {
		log.Printf("failed to open dir : %v", err)
		http.Error(w, err.Error(), 500)
		return
	}

	buf := bufio.NewWriter(w)
	for _, f := range dir {
		buf.WriteString(f.Name() + "\n")
	}
	if err := buf.Flush(); err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
}
