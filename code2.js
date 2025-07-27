document.addEventListener("DOMContentLoaded", function () {
    const addNotesBtn = document.getElementById("addNotesBtn");
    const noteForm = document.getElementById("note-Form");
    const saveBtn = document.getElementById("save-Button");
    const charCount = document.getElementById("charaCount");
    const limitMsg = document.getElementById("limitMessage");
    const noteInput = document.getElementById("user-text");
    const existingNotes = document.getElementById("existingNotes");
    const noNotesMsg = document.getElementById("no-notes-msg");

    // Toggle note form
    if (addNotesBtn && noteForm) {
        addNotesBtn.addEventListener("click", function () {
            noteForm.style.display = noteForm.style.display === "block" ? "none" : "block";
        });
    }

    // Live character count
    if (noteInput && charCount && limitMsg) {
        noteInput.addEventListener("input", function () {
            const len = this.value.length;
            charCount.textContent = "Total number of Characters : " + len;
            limitMsg.style.display = len > 1500 ? "block" : "none";
        });
    }

    // Save note via AJAX
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
                    // Remove "No notes created yet." message if exists
                    const noNotes = document.getElementById("no-notes-msg");
                    if (noNotes) {
                        noNotes.remove();
                    }

                    // Convert note text to HTML with <br> for new lines
                    const formattedNote = res.note.replace(/\n/g, "<br>");

                    // Create new note element
                    const noteContainer = document.createElement("div");
                    noteContainer.className = "bg-white p-4 rounded shadow mt-4";
                    noteContainer.style.opacity = 0; // For animation

                    noteContainer.innerHTML = `
                        <div class="flex items-center mb-2">
                            <img src="uploads/${res.avatar}" class="w-10 h-10 rounded-full mr-3" alt="Avatar">
                            <strong>${res.screen_name}</strong>
                        </div>
                        <p class="text-gray-700 mb-1">${formattedNote}</p>
                        <small class="text-gray-500 block">${res.created_at} | Words: ${res.word_count}</small>
                    `;

                    // Prepend to the top
                    existingNotes.prepend(noteContainer);

                    // Animate fade-in
                    setTimeout(() => {
                        noteContainer.style.transition = "opacity 0.5s ease";
                        noteContainer.style.opacity = 1;
                    }, 10);

                    // Reset the form
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

