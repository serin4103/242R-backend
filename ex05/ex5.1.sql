-- c1이11이고c2가2인row의id,c3,c5 column을조회
SELECT `id`, `c3` `c5` FROM `crud` WHERE `c1`=11 AND `c2`=2;

-- c1이18보다크거나c2가2보다작은row의모든column을조회
SELECT * FROM `crud` WHERE `c1`>18 OR `c2`<2;

-- id와c4는기본값,c1은7, c2는4, c3는“col101”,c5는0인row를생성
INSERT INTO `crud` (c1,c2,c3,c5) VALUES (7,4,'col101',0);

-- id는103, c1은3, c2는3, c3는“col103”,c4는기본값,c5는1인row를생성
INSERT INTO `crud` (id,c1,c2,c3,c5) VALUES (103,3,3,'col103',1);

-- id가100보다큰row의모든column을조회
SELECT * FROM `crud` WHERE `id`>100;

-- c1이4보다크고9보다작고,c2가1인row의c3를“col0”,c5를0으로수정
UPDATE `crud` SET `c3`='col0', `c5`=0 WHERE `c1`>4 AND `c1`<9 AND `c2`=1;

-- c1이4보다크고9보다작고,c2가1인row의모든column을조회
SELECT * FROM `crud` WHERE `c1`>4 AND `c1`<9 AND `c2`=1;

-- c5가0인row를삭제
DELETE FROM `crud` WHERE `c5`=0;

-- c5가0인row의모든column을조회
SELECT * FROM `crud` WHERE `c5`=0;


