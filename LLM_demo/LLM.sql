-- Databricks notebook source
-- drop table response_feedbacks

-- COMMAND ----------

-- Command to create the table
CREATE TABLE response_feedbacks (
feedback_id BIGINT,
model_endpoint STRING NOT NULL, 
request_id BIGINT NOT NULL,
question STRING NOT NULL,
answer STRING NOT NULL,
response_ms INT, 
tokens_used INT,
comment STRING, 
rating INT, 
created_on TIMESTAMP);

-- COMMAND ----------

-- Command describing the table Schema
DESCRIBE response_feedbacks

-- COMMAND ----------

-- Command to insert the data into the table

INSERT INTO response_feedbacks (feedback_id, model_endpoint, request_id, question, answer, response_ms, tokens_used, comment, rating, created_on)
VALUES
    (1, 'model 1', 101, 'Question 1', 'Answer 1', 400, 10, 'Good job!', 5, '2023-07-28 10:15:00'),
    (2, 'model 1', 102, 'Question 2', 'Answer 2', 300, 10, 'Excellent!', 4, '2023-07-28 10:30:00'),
    (3, 'model 1', 103, 'Question 3', 'Answer 3', 200, 8, 'Nice work!', 3, '2023-07-28 11:00:00'),
    (4, 'model 1', 104, 'Question 4', 'Answer 4', 100, 7, 'Could be better', 3, '2023-07-28 11:30:00'),
    (5, 'model 1', 105, 'Question 5', 'Answer 5', 100, 9, 'Well done!', 5, '2023-07-28 12:00:00'),
    (6, 'model 2', 201, 'Question 1', 'Answer 1', 4000, 11, 'Great job!', 4, '2023-07-28 10:45:00'),
    (7, 'model 2', 202, 'Question 2', 'Answer 2', 1000, 13, 'Good Effort', 3, '2023-07-28 11:15:00'),
    (8, 'model 2', 203, 'Question 3', 'Answer 3', 6000, 7, 'Fine', 2, '2023-07-28 11:45:00'),
    (9, 'model 2', 204, 'Question 4', 'Answer 4', 4000, 14, 'improve', 1, '2023-07-28 12:15:00'),
    (10, 'model 2', 205, 'Question 5', 'Answer 5', 1000, 10, 'Poor!', 1, '2023-07-28 12:45:00'),
    (11, 'model 3', 301, 'Question 1', 'Answer 1', 500, 9, 'Not Good', 1, '2023-07-28 11:30:00'),
    (12, 'model 3', 302, 'Question 2', 'Answer 2', 1000, 11, 'Poor', 2, '2023-07-28 12:00:00'),
    (13, 'model 3', 303, 'Question 3', 'Answer 3', 4000, 7, 'Not Good', 2, '2023-07-28 12:30:00'),
    (14, 'model 3', 304, 'Question 4', 'Answer 4', 2000, 16, 'Needs improvement', 2, '2023-07-28 13:00:00'),
    (15, 'model 3', 305, 'Question 5', 'Answer 5', 100, 10, 'Poor', 1, '2023-07-28 13:30:00');


-- COMMAND ----------

-- Widget 1 : Average ratings by model
SELECT model_endpoint, AVG(rating)
FROM response_feedbacks
GROUP BY model_endpoint;


-- COMMAND ----------

--Widget 1 : Average token count by model
select model_endpoint ,avg(tokens_used) from response_feedbacks  group by model_endpoint

-- COMMAND ----------

-- Widget 1 : Average response time by model
select model_endpoint ,avg(response_ms) from response_feedbacks  group by model_endpoint

-- COMMAND ----------

-- Widget 2 : Average rating over time
SELECT model_endpoint, DATE(created_on) AS date, AVG(rating) AS avg_rating
FROM response_feedbacks
GROUP BY model_endpoint, DATE(created_on)


-- COMMAND ----------

-- Widget 2 : Average token count over time 
SELECT model_endpoint, DATE(created_on) AS date, AVG(tokens_used) AS avg_token_count
FROM response_feedbacks
GROUP BY model_endpoint, DATE(created_on)


-- COMMAND ----------

-- Widget 2 : Average response time over time
SELECT model_endpoint, DATE(created_on) AS date, AVG(response_ms) AS avg_response_time
FROM response_feedbacks
GROUP BY model_endpoint, DATE(created_on)


-- COMMAND ----------

-- Widget 3 : Raw Data
select feedback_id, rating, question, answer, created_on, model_endpoint, tokens_used, response_ms
from response_feedbacks  

-- COMMAND ----------


