// SPDX-License-Identifier: MIT
// solidity version requierments
pragma solidity >=0.4.22 <0.9.0;

contract NotesContract {
    // Int 0-2^256 number
    uint256 public noteCount = 0;

    // Define kind of data type
    struct Note {
        uint256 id;
        string title;
        string description;
    }

    // Hashtable mapping numbers to Note data type
    mapping(uint256 => Note) public notes;

    // Define events which may happen in the blockchain
    event NoteCreated(uint256 id, string title, string description);
    event NoteDeleted(uint256 id);

    // Define createNote function which add new object to notes map structure and update the blockchain by event 
    function createNote(string memory _title, string memory _description)
        public
    {
        notes[noteCount] = Note(noteCount, _title, _description);
        emit NoteCreated(noteCount, _title, _description);
        noteCount++;
    }

    // Define deleteNote structure which remove the note from notes and update the blockchain by event
    function deleteNote(uint256 _id) public {
        delete notes[_id];
        emit NoteDeleted(_id);
        noteCount--;
    }
}