-- ------------------------------
-- Insert demo user if not exists
-- ------------------------------
INSERT INTO users (user_name, user_email, user_password)
SELECT 'Demo User', 'demo@navi.app', 'password123'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE user_email = 'demo@navi.app'
);

-- ------------------------------
-- Insert trip if not exists
-- ------------------------------
INSERT INTO trips (trip_title, trip_description, trip_location, trip_duration, user_id)
SELECT
    'Explore Toronto',
    'A 3-day adventure exploring the best of Toronto',
    'Toronto, ON, Canada',
    '{"startDate":"2025-11-27","startTime":"09:00","endDate":"2025-11-29","endTime":"18:00"}',
    u.id
FROM users u
WHERE u.user_email = 'demo@navi.app'
  AND NOT EXISTS (
      SELECT 1
      FROM trips t
      WHERE t.trip_title = 'Explore Toronto'
        AND t.user_id = u.id
  );

-- ------------------------------
-- Insert events if not exists
-- ------------------------------
INSERT INTO events (event_title, event_description, event_location, event_duration, trip_id)
SELECT v.event_title, v.event_description, v.event_location, v.event_duration, t.id
FROM trips t
CROSS JOIN (VALUES
    ('CN Tower Visit', 'Visit the iconic CN Tower and enjoy panoramic views of Toronto', '290 Bremner Blvd, Toronto, ON M5V 3L9', '{"startDate":"2025-11-27","startTime":"09:00","endDate":"2025-11-27","endTime":"11:30"}'),
    ('Ripley''s Aquarium', 'Explore marine life at Canada''s largest aquarium', '288 Bremner Blvd, Toronto, ON M5V 3L9', '{"startDate":"2025-11-27","startTime":"12:00","endDate":"2025-11-27","endTime":"14:30"}'),
    ('St. Lawrence Market', 'Browse local vendors and enjoy authentic Canadian cuisine', '93 Front St E, Toronto, ON M5E 1C3', '{"startDate":"2025-11-27","startTime":"15:00","endDate":"2025-11-27","endTime":"18:00"}'),
    ('Royal Ontario Museum', 'Discover world cultures and natural history', '100 Queens Park, Toronto, ON M5S 2C6', '{"startDate":"2025-11-28","startTime":"09:00","endDate":"2025-11-28","endTime":"12:00"}'),
    ('Distillery District', 'Walk through historic cobblestone streets filled with art galleries and cafes', '9 Trinity St, Toronto, ON M5A 3C4', '{"startDate":"2025-11-28","startTime":"13:00","endDate":"2025-11-28","endTime":"15:30"}'),
    ('Harbourfront Centre', 'Enjoy waterfront activities and entertainment', '235 Queens Quay W, Toronto, ON M5J 2G8', '{"startDate":"2025-11-28","startTime":"16:00","endDate":"2025-11-28","endTime":"18:00"}'),
    ('Casa Loma', 'Tour Toronto''s majestic Gothic Revival castle', '1 Austin Terrace, Toronto, ON M5R 1X8', '{"startDate":"2025-11-29","startTime":"09:00","endDate":"2025-11-29","endTime":"11:30"}'),
    ('Kensington Market', 'Explore the eclectic bohemian neighborhood', 'Kensington Ave, Toronto, ON M5T 2K1', '{"startDate":"2025-11-29","startTime":"12:00","endDate":"2025-11-29","endTime":"14:30"}'),
    ('High Park', 'Relax in Toronto''s largest public park', '1873 Bloor St W, Toronto, ON M6R 2Z3', '{"startDate":"2025-11-29","startTime":"15:00","endDate":"2025-11-29","endTime":"18:00"}')
) AS v(event_title, event_description, event_location, event_duration)
WHERE t.trip_title = 'Explore Toronto'
  AND NOT EXISTS (
      SELECT 1
      FROM events e
      WHERE e.event_title = v.event_title
        AND e.trip_id = t.id
  );

-- ------------------------------
-- Insert locations if not exists
-- ------------------------------
INSERT INTO locations (latitude, longitude, address, title, event_id)
SELECT v.latitude, v.longitude, v.address, v.title, e.id
FROM events e
JOIN (VALUES
    ('CN Tower Visit', 43.6426, -79.3871, '290 Bremner Blvd, Toronto, ON M5V 3L9', 'CN Tower'),
    ('Ripley''s Aquarium', 43.6424, -79.3860, '288 Bremner Blvd, Toronto, ON M5V 3L9', 'Ripley''s Aquarium of Canada'),
    ('St. Lawrence Market', 43.6487, -79.3716, '93 Front St E, Toronto, ON M5E 1C3', 'St. Lawrence Market'),
    ('Royal Ontario Museum', 43.6677, -79.3948, '100 Queens Park, Toronto, ON M5S 2C6', 'Royal Ontario Museum'),
    ('Distillery District', 43.6503, -79.3599, '9 Trinity St, Toronto, ON M5A 3C4', 'Distillery District'),
    ('Harbourfront Centre', 43.6388, -79.3831, '235 Queens Quay W, Toronto, ON M5J 2G8', 'Harbourfront Centre'),
    ('Casa Loma', 43.6780, -79.4094, '1 Austin Terrace, Toronto, ON M5R 1X8', 'Casa Loma'),
    ('Kensington Market', 43.6544, -79.4005, 'Kensington Ave, Toronto, ON M5T 2K1', 'Kensington Market'),
    ('High Park', 43.6465, -79.4637, '1873 Bloor St W, Toronto, ON M6R 2Z3', 'High Park')
) AS v(event_title, latitude, longitude, address, title)
ON e.event_title = v.event_title
WHERE NOT EXISTS (
    SELECT 1
    FROM locations l
    WHERE l.event_id = e.id
      AND l.title = v.title
);