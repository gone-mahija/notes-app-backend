package com.example.notes.note;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface NoteRepository extends JpaRepository<Note, Long> {

    // custom finder for shareUuid
    Optional<Note> findByShareUuid(String shareUuid);
}
