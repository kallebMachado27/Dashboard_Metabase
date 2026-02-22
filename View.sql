CREATE OR REPLACE VIEW vw_vendas_detalhada AS
SELECT
    p.id AS pedido_id,
    CAST(p.criado_em AS DATE) AS data_pedido,
    p.total AS valor_total_pedido,
    p.cliente_id,
    c.nome AS cliente_nome,
    pr.id AS produto_id,
    pr.nome AS produto_nome,
    pi.quantidade AS qtd_itens,
    pi.preco_unitario,
    (pi.quantidade * pi.preco_unitario) AS valor_item,
    pg.status AS status_pagamento
FROM pedidos p
INNER JOIN clientes c ON c.id = p.cliente_id
INNER JOIN pagamentos pg ON pg.pedido_id = p.id
INNER JOIN pedido_itens pi ON pi.pedido_id = p.id
INNER JOIN produtos pr ON pr.id = pi.produto_id
WHERE pg.status = 'PAGO';