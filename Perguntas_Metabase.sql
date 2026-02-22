--Aqui estão as perguntas usadas no metabase.
  
--PEDIDOS:
SELECT 
  COUNT(DISTINCT pedido_id) AS total_pedidos
FROM vw_vendas_detalhada
WHERE 1 = 1 
[[AND {{data}} ]];

--FATURAMENTO:
SELECT
  SUM(valor_item) AS faturamento_total
FROM vw_vendas_detalhada
WHERE {{DATA}};

--TICKET MÉDIO:
SELECT 
  SUM(valor_item) / COUNT(DISTINCT pedido_id) AS ticket_medio
FROM vw_vendas_detalhada
WHERE {{data}};

--FATURAMENTO MENSAL:
SELECT 
  DATE_FORMAT(data_pedido, '%Y-%m') AS Mes,
  SUM(valor_item) AS faturamento_mensal
FROM vw_vendas_detalhada
WHERE {{Mes}}
GROUP BY DATE_FORMAT(data_pedido, '%Y-%m')
ORDER BY Mes ASC;

--TOP 10 PRODUTOS:
SELECT 
    produto_nome,
    SUM(qtd_itens) AS unidades_vendidas
FROM vw_vendas_detalhada
WHERE {{Data}}
GROUP BY produto_nome
ORDER BY unidades_vendidas DESC
LIMIT 10;

--TOP 10 CLIENTES:
SELECT 
    cliente_nome,
    SUM(valor_item) AS total_gasto
FROM vw_vendas_detalhada
WHERE {{Data}}
GROUP BY cliente_nome
ORDER BY total_gasto DESC
LIMIT 10;

