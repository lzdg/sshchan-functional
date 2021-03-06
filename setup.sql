PRAGMA foreign_keys = ON;

CREATE TABLE boards (
    board_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    board_name VARCHAR(255) NOT NULL,
    board_description VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    post_ip VARCHAR(39),
    post_date DATE NOT NULL,
    post_last_bumped DATETIME NOT NULL,
    post_stickied BOOLEAN NOT NULL,
    post_locked BOOLEAN NOT NULL,
    post_subject VARCHAR(255),
    post_by VARCHAR(255),
    post_content TEXT NOT NULL,
    post_board INT(8) NOT NULL,
    post_reply INT(8),
    FOREIGN KEY(post_board) REFERENCES boards(board_id) ON DELETE CASCADE,
    FOREIGN KEY(post_reply) REFERENCES posts(post_id) ON DELETE CASCADE
);

CREATE TABLE bans (
    ban_ip VARCHAR(39) NOT NULL,
    ban_board INT,
    ban_reason TEXT NOT NULL,
    ban_until DATETIME
);

CREATE TABLE reports (
    report_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    report_post INTEGER NOT NULL,
    report_board INT(8) NOT NULL,
    report_reason TEXT NOT NULL,
    report_time DATETIME NOT NULL,
    report_by VARCHAR(39) NOT NULL
);

