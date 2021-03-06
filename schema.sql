CREATE TABLE users (
  username text PRIMARY KEY,
  password text NOT NULL
);

CREATE TABLE todolists (
  id serial PRIMARY KEY,
  title text UNIQUE NOT NULL CHECK(length(title) > 0 AND length(title) <= 100),
  username text NOT NULL REFERENCES users (username) ON DELETE CASCADE
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  title text NOT NULL CHECK(length(title) > 0 AND length(title) <= 100),
  done boolean NOT NULL DEFAULT false,
  username text NOT NULL REFERENCES users (username) ON DELETE CASCADE,
  todolist_id integer NOT NULL REFERENCES todolists (id) ON DELETE CASCADE
);