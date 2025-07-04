document.addEventListener("DOMContentLoaded", function () {
    const addNotesBtn = document.getElementById("addNotesBtn");
    const noteForm = document.getElementById("note-Form");
    const saveBtn = document.getElementById("save-Button");
    const charCount = document.getElementById("charaCount");
    const limitMsg = document.getElementById("limitMessage");
    const noteInput = document.getElementById("user-text");

    // Show the note form when "Add Notes" is clicked
    if (addNotesBtn && noteForm) {
        addNotesBtn.addEventListener("click", function () {
            noteForm.style.display = "block";
        });
    }

    // Character count logic
    if (noteInput && charCount && limitMsg) {
        noteInput.addEventListener("input", function () {
            const len = this.value.length;
            charCount.textContent = "Total number of Characters : " + len;
            limitMsg.style.display = len > 1500 ? "block" : "none";
        });
    }

    // Save note logic
    if (saveBtn && noteInput) {
        saveBtn.addEventListener("click", function () {
            const note = noteInput.value.trim();
            const topicId = new URLSearchParams(window.location.search).get("topic_id");

            if (!note || !topicId) {
                alert("Please enter a note and ensure topic ID is available.");
                return;
            }

            const xhr = new XMLHttpRequest();
            xhr.open("POST", "addnote.php", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onload = function () {
    const res = JSON.parse(this.responseText);
    if (res.success) {
        const noteHTML = `
            <div class="note-entry">
                <img src="${res.avatar}" class="avatar" alt="Avatar" />
                <strong>${res.screen_name}</strong>: 
                ${res.note.replace(/\n/g, "<br>")}
                <div><small>${res.created_at} | Words: ${res.word_count}</small></div>
            </div>
        `;
        document.getElementById("existingNotes").insertAdjacentHTML("afterbegin", noteHTML);
        noteInput.value = "";
        charCount.textContent = "Total number of Characters : 0";
        noteForm.style.display = "none";
    } else {
        alert("❌ Failed to save note: " + res.message);
    }
};


            const data = "note=" + encodeURIComponent(note) + "&topic_id=" + encodeURIComponent(topicId);
            xhr.send(data);
        });
    }
});
