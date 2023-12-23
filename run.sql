-- Виклик функції
SELECT delete_anime_rating_less_nine() AS anime_with_rating_less_nine;
SELECT * FROM Anime;
SELECT * FROM Anime_genre;

-- Виклик процедури
CALL add_animation_studio(1, 'MAPPA Co., Ltd', 'Japan', '2011-06-14');
SELECT * FROM Animation_studio;

-- Перевірка роботи тригера
INSERT INTO Animation_studio (studio_id, name, country, founded) VALUES (2, 'Studio Ghibli, Inc.', 'Japan', '1985-06-15');