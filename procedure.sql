-- Процедура, яка додає в таблицю Animation_studio новий рядок з аргументами
CREATE OR REPLACE PROCEDURE add_animation_studio(
    IN in_studio_id INT,
    IN in_name VARCHAR(200),
    IN in_country VARCHAR(200),
    IN in_founded DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Перевіряємо, чи студія з такою назвою вже існує
    IF NOT EXISTS (SELECT 1 FROM Animation_studio WHERE name = in_name) THEN
      -- Перевіряємо, чи існує вказаний id студії, інакше генеруємо новий доступний id
      IF EXISTS (SELECT 1 FROM Animation_studio WHERE studio_id = in_studio_id) THEN
          RAISE NOTICE 'Студія з id % вже існує. Згенеровано новий доступний id.', in_studio_id;
          in_studio_id := (SELECT COALESCE(MAX(studio_id), 0) + 1 FROM Animation_studio);
    	  END IF;

    	  -- Додаємо новий запис до таблиці Animation_studio
    	  INSERT INTO Animation_studio (studio_id, name, country, founded)
    	  VALUES (in_studio_id, in_name, in_country, in_founded);
    ELSE
        RAISE NOTICE 'Студія з назвою % вже існує. Дані не були додані.', in_name;
    END IF;
END;
$$;

-- Перевірка роботи процедури
CALL add_animation_studio(1, 'MAPPA Co., Ltd', 'Japan', '2011-06-14');
-- SELECT * FROM Animation_studio;
-- delete from animation_studio
-- where studio_id = 1