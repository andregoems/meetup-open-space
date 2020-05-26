create external schema dl_trusted from data catalog 
database 'trusted' 
iam_role 'arn:aws:iam::853222038113:role/awsdwredshifts3'
create external database if not exists;