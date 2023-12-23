-- Тригер, який придодаванні, оновлені або видаленні рядка з таблиці Animation_studio
-- виводить повідомлення з інформацією про зміни.
CREATE OR REPLACE FUNCTION log_animation_studio_changes()
RETURNS TRIGGER AS
$$
BEGIN
    RAISE NOTICE 'Був модифікований запис в таблиці Animation_studio. Попереднє ім''я: %, Нове ім''я: %', NEW.name, NEW;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER log_animation_studio_changes
AFTER INSERT OR UPDATE OR DELETE
ON Animation_studio
FOR EACH ROW
EXECUTE FUNCTION log_animation_studio_changes();