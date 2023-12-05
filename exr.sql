DELIMITER //

CREATE PROCEDURE RelatorioDiario()
BEGIN
    -- Cria uma tabela temporária para armazenar o resultado
    CREATE TEMPORARY TABLE TempRelatorioDiario (
        data_compra DATE,
        total_produtos INT
    );

    -- Insere os dados na tabela temporária
    INSERT INTO TempRelatorioDiario (data_compra, total_produtos)
    SELECT 
        data_compra,
        SUM(quantidade) AS total_produtos
    FROM vendas
    GROUP BY data_compra;

    -- Exibe o resultado
    SELECT * FROM TempRelatorioDiario;

    -- Limpa a tabela temporária
    DROP TEMPORARY TABLE IF EXISTS TempRelatorioDiario;
END //

DELIMITER ;
