CREATE TYPE user_role AS ENUM ('client', 'moderator')
CREATE TYPE item_type AS ENUM ('electronics', 'clothes', 'shoes')
CREATE TYPE reception_status AS ENUM ('in_progress', 'close');

CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role user_role NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE pvz (
  id SERIAL PRIMARY KEY,
  city VARCHAR(50) NOT NULL CHECK (city in ('Москва', 'Санкт-Петербург', 'Казань')),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE receptions(
  id SERIAL PRIMARY KEY,
  pvz_id INTEGER REFERENCES pvz(id),
  status reception_status NOT NULL DEFAULT 'in_progress',
  started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  closed_at TIMESTAMP,
  CONSTRAINT fk_pvz FOREIGN KEY (pvz_id) REFERENCES pvz(id) ON DELETE CASCADE
)

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  reception_id INTEGER REFERENCES receptions(id),
  item_type item_type NOT NULL,
  received_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_reception FOREIGN KEY (reception_id) REFERENCES receptions(id) ON DELETE CASCADE
)