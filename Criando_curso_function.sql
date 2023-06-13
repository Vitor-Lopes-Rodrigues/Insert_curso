drop function criar_curso
CREATE FUNCTION criar_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$
	DECLARE
	id_categoria INTEGER;
	BEGIN
	SELECT id INTO id_categoria FROM categoria WHERE nome = nome_categoria;
	--FOUND(Uma variável que informa se houve algum resultado produzido pela última query executada)
	IF NOT FOUND THEN
		INSERT INTO categoria (nome) VALUES (nome_categoria) RETURNING id INTO id_categoria;
		END IF;
		
		INSERT INTO curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
	END;
$$ LANGUAGE plpgsql;

SELECT criar_curso('PHP','Programação');
SELECT criar_curso('Java','Programação');

SELECT * FROM curso;
SELECT * from categoria;