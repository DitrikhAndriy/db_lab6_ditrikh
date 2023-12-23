-- Видалення всіх аніме в яких рейтинг менше чим 9
DROP FUNCTION IF EXISTS delete_anime_rating_less_nine();
CREATE OR REPLACE FUNCTION delete_anime_rating_less_nine()
RETURNS VOID AS
$$
BEGIN
	-- Видаляємо зв'язані записи з таблиці Anime_genre
	DELETE FROM Anime_genre
	WHERE anime_id IN (SELECT anime_id FROM Anime WHERE rating < 9.0);

    -- Видаляємо записи з таблиці Anime
    DELETE FROM Anime
    WHERE rating < 9.0;
END;
$$
LANGUAGE plpgsql;

-- Перевірка роботи функції
SELECT delete_anime_rating_less_nine() AS anime_with_rating_less_nine;
-- SELECT * FROM Anime;
-- SELECT * FROM Anime_genre;