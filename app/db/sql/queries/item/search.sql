/*
    Search for an item by name and description
*/
SELECT
    name,
    description
FROM
    (
        SELECT
            item.name,
            item.description,
            setweight(to_tsvector(item.name), 'A') || 
            setweight(to_tsvector(item.description), 'B') as document
            -- SELECT word FROM ts_stat('
            --     SELECT
            --         to_tsvector('simple', item.name) || 
            --         to_tsvector('simple', item.description)
            --     FROM
            --         item
            -- ')
        FROM
            item
    ) item_search
WHERE
    item_search.document @@ to_tsquery(${queryString})
    OR (
        item_search.name % ${queryString}
        AND similarity(item_search.name, ${queryString}) > 0.3 -- setting this higher than 0.3?
    )
ORDER BY
    item_search.name <-> ${queryString},
    ts_rank(item_search.document, to_tsquery(${queryString})) DESC;








--     SELECT pid, p_title
-- FROM (SELECT post.id as pid,
--              post.title as p_title,
--              to_tsvector(post.title) || 
--              to_tsvector(post.content) ||
--              to_tsvector(author.name) ||
--              to_tsvector(coalesce(string_agg(tag.name, ' '))) as document
--       FROM post
--       JOIN author ON author.id = post.author_id
--       JOIN posts_tags ON posts_tags.post_id = posts_tags.tag_id
--       JOIN tag ON tag.id = posts_tags.tag_id
--       GROUP BY post.id, author.id) p_search
-- WHERE p_search.document @@ to_tsquery('Endangered & Species');