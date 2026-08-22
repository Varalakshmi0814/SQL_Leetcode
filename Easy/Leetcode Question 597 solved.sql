-- Q.598 Write a query to find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests. 

CREATE TABLE friend_request (	
    sender_id INT,	
    send_to_id INT,	
    request_date DATE,	
    PRIMARY KEY (sender_id, send_to_id, request_date)	
);	
	
CREATE TABLE request_accepted (	
    requester_id INT,	
    accepter_id INT,	
    accept_date DATE,	
    PRIMARY KEY (requester_id, accepter_id, accept_date)	
);	
	
	
INSERT INTO friend_request (sender_id, send_to_id, request_date) VALUES (1, 2, '2016-06-01');	
INSERT INTO friend_request (sender_id, send_to_id, request_date) VALUES (1, 3, '2016-06-01');	
INSERT INTO friend_request (sender_id, send_to_id, request_date) VALUES (1, 4, '2016-06-01');	
INSERT INTO friend_request (sender_id, send_to_id, request_date) VALUES (2, 3, '2016-06-02');	
INSERT INTO friend_request (sender_id, send_to_id, request_date) VALUES (3, 4, '2016-06-09');	
	
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES (1, 2, '2016-06-03');	
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES (1, 3, '2016-06-08');	
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES (2, 3, '2016-06-08');	
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016-06-09');	
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016-06-10');	
	
select * from friend_request;	
select * from request_accepted;	

SELECT 
    IFNULL(ROUND(accepts / requests, 2), 0.0) AS acceptance_rate
FROM
    (SELECT COUNT(DISTINCT sender_id, send_to_id) AS requests FROM friend_request) f1,
    (SELECT COUNT(DISTINCT requester_id, accepter_id) AS accepts FROM request_accepted) r1;