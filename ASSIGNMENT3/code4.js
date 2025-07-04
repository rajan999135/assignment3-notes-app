// Display the saved topic title, creation date, and "View Notes" button.
function displayTopicTitle() {
    var topicName = localStorage.getItem("topicName");
    var creationDate = localStorage.getItem("creationDate");
    var topicContainer = document.getElementById("topicContainer");

    // If no topic is saved, display a default message.
    if (!topicName) {
      topicContainer.innerHTML = "<p>No topic has been created yet.</p>";
      return;
    }

    // Clear any previous content.
    topicContainer.innerHTML = "";

    // Create and append the topic title.
    var titleHeading = document.createElement("h2");
    titleHeading.textContent = "Title: " + topicName;
    topicContainer.appendChild(titleHeading);

    // Create and append the creation date/time.
    var dateParagraph = document.createElement("p");
    dateParagraph.innerHTML = "<strong>Created on:</strong> " + creationDate;
    topicContainer.appendChild(dateParagraph);

    
  }

  // Run the display function once the DOM is fully loaded.
  document.addEventListener("DOMContentLoaded", displayTopicTitle);