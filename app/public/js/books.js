const BookApp = {
  data() {
    return {
        books: [],
        bookForm: {},
        selectedBook: null,
      "books":  {
          title: {},
          author: {},
          year_published: {},
          publisher: {},
          page_count: {},
          msrp: {},
      },
    }
  },
  computed: {},
  methods: {
    fetchBooksData() {
        fetch('/api/books/')
        .then(response => response.json())
        .then( (responseJson) => {
            console.log(responseJson);
            this.books = responseJson;
        })
        .catch( (err) => {
            console.error(err);
        })
    },
    postBook(evt) {
      if (this.selectedBook === null) {
          this.postNewBook(evt);
      } else {
          this.postEditBook(evt);
      }
    },
    postNewBook(evt) {
      console.log("Posting:", this.bookForm);
      // alert("Posting!");

      fetch('api/books/create.php', {
          method:'POST',
          body: JSON.stringify(this.bookForm),
          headers: {
            "Content-Type": "application/json; charset=utf-8"
          }
        })
        .then( response => response.json() )
        .then( json => {
          console.log("Returned from post:", json);
          // TODO: test a result was returned!
          this.books = json;
          
          // reset the form
          this.bookForm = {};
        });
    },
    postEditBook(evt) {
      this.bookForm.id = this.selectedBook.id;       
      
      console.log("Updating!", this.bookForm);

      fetch('api/books/update.php', {
          method:'POST',
          body: JSON.stringify(this.bookForm),
          headers: {
            "Content-Type": "application/json; charset=utf-8"
          }
        })
        .then( response => response.json() )
        .then( json => {
          console.log("Returned from post:", json);
          // TODO: test a result was returned!
          this.books = json;
          
          this.resetBookForm();
        });
    },
    postDeleteBook(o) {
      if (!confirm("Are you sure you want to delete the book")) {
          return;
      }
      
      fetch('api/books/delete.php', {
          method:'POST',
          body: JSON.stringify(o),
          headers: {
            "Content-Type": "application/json; charset=utf-8"
          }
        })
        .then( response => response.json() )
        .then( json => {
          console.log("Returned from post:", json);
          // TODO: test a result was returned!
          this.books = json;
          
          this.resetBookForm();
        });
    },
    selectBook(o) {
      this.selectedBook = o;
      this.bookForm = Object.assign({}, this.selectedBook);
    },
    resetBookForm() {
      this.selectedBook = null;
      this.bookForm = {};
    }
  },
  created() {
      this.fetchBooksData();
  }
}

Vue.createApp(BookApp).mount('#booksApp'); 