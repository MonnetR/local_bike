SELECT
    feedback_id,
    order_id,
    feedback_score,
    DATETIME(feedback_form_sent_date) AS feedback_form_sent_date,
    DATETIME(feedback_answer_date) AS feedback_answer_date
FROM {{ source('dataset_fil_rouge', 'feedback') }}
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY feedback_id   -- colonnes qui définissent un doublon
    ORDER BY feedback_form_sent_date DESC         -- critère pour choisir la ligne à garder
) = 1