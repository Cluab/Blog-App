// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Get the link and add a click event listener to it
// document.getElementById("add-comment-link").addEventListener("click", function(e) {
//     // Prevent the default link behavior (i.e., opening the link's href)
//     e.preventDefault();
  
//     // Create a new popup window
//     var popupWindow = window.open("", "Add Comment", "width=400,height=300");
  
//     // Set the contents of the popup window to a form that posts to the comments#create action
//     popupWindow.document.write(`
//       <form action="${this.href}" method="post">
//         <textarea name="comment[text]" placeholder="Type your comment here"></textarea>
//         <input type="submit" value="Create Comment">
//       </form>
//     `);
//   });
