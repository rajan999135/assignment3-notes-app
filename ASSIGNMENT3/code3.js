function validateTopicName() {
    const topicNameInput = document.getElementById("topic-name");
    const topicName = topicNameInput.value.trim();
    const errorMessage = document.getElementById("topic-error");

    const words = topicName.split(/\s+/).filter(word => word.length > 0);
    const wordCount = words.length;

    errorMessage.textContent = ""; // Clear previous error
    topicNameInput.style.borderColor = ""; // Reset border

    if (topicName === "") {
        errorMessage.textContent = "❌ Topic name cannot be blank.";
        topicNameInput.style.borderColor = "red";
        return false;
    } else if (wordCount > 300) {
        errorMessage.textContent = "⚠️ Word limit exceeded. Max 300 words allowed.";
        topicNameInput.style.borderColor = "red";
        return false;
    } else {
        topicNameInput.style.borderColor = "green";
        return true;
    }
}

// Live word count and error control
function updateWordCount() {
    const topicNameInput = document.getElementById("topic-name");
    const wordCountDiv = document.getElementById("word-count");
    const errorMessage = document.getElementById("topic-error");
    const submitButton = document.getElementById("submit-button");

    topicNameInput.addEventListener("input", () => {
        const text = topicNameInput.value.trim();
        const words = text.split(/\s+/).filter(word => word.length > 0);
        const wordCount = words.length;

        wordCountDiv.textContent = `${wordCount} words`;

        if (text === "") {
            errorMessage.textContent = "❌ Topic name cannot be blank.";
            wordCountDiv.style.color = "red";
            submitButton.disabled = true;
            topicNameInput.style.borderColor = "red";
        } else if (wordCount > 300) {
            errorMessage.textContent = "⚠️ Word limit exceeded. Max 300 words allowed.";
            wordCountDiv.style.color = "red";
            submitButton.disabled = true;
            topicNameInput.style.borderColor = "red";
        } else {
            errorMessage.textContent = "";
            wordCountDiv.style.color = "black";
            submitButton.disabled = false;
            topicNameInput.style.borderColor = "green";
        }
    });
}

// Prevent form submission if validation fails
function submitTopicForm(event) {
    if (!validateTopicName()) {
        event.preventDefault(); // Stop PHP form submission
    }
}

// Attach on DOM load
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("topic-form").addEventListener("submit", submitTopicForm);
    updateWordCount();
});
