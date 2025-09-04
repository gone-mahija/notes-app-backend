package com.example.notes.note;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor   // generates constructor for final fields
public class NoteService {

    private final NoteRepository noteRepository;

    public List<Note> getAllNotes() {
        return noteRepository.findAll();
    }

    public Optional<Note> getNoteById(Long id) {
        return noteRepository.findById(id);
    }

    public Note createNote(Note note) {
        note.setCreatedAt(Instant.now());
        note.setUpdatedAt(Instant.now());
        note.setShareUuid(UUID.randomUUID().toString()); // auto-generate share link UUID
        return noteRepository.save(note);
    }


    @Transactional
    public Optional<Note> updateNote(Long id, Note noteDetails) {
        return noteRepository.findById(id).map(note -> {
            note.setTitle(noteDetails.getTitle());
            note.setContent(noteDetails.getContent());
            return noteRepository.save(note);
        });
    }

    public void deleteNote(Long id) {
        noteRepository.deleteById(id);
    }

    public Optional<Note> getNoteByShareUuid(String uuid) {
        return noteRepository.findByShareUuid(uuid);
    }
}
