-- ID가11인노선을예매한모든승객의ID(id),이름(name),좌석번호(seat_number)를좌석번호의오름차순으로조회
SELECT `users`.`id` AS `id`, `users`.`name` AS `name`, `tickets`.`seat_number` AS `seat_number` FROM `users` 
    INNER JOIN `tickets` ON `users`.`id`=`tickets`.`user` WHERE `tickets`.`train`=11 ORDER BY `tickets`.`seat_number`;

-- 각사용자의ID(id),이름(name),탑승열차수(trains_count),총거리(total_distance)를총거리의내림차순으로상위6명만조회
SELECT `users`.`id` AS `id`, `users`.`name` AS `name`, COUNT(`tickets`.`train`) AS `trains_count`, SUM(`trains`.`distance`)*.1 AS `total_distance` FROM `users` 
    INNER JOIN `tickets` ON `users`.`id`=`tickets`.`user` 
    INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id`
    GROUP BY `users`.`id` ORDER BY `total_distance` DESC LIMIT 6;

-- 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),여행시간(travel_time)을여행시간의내림차순으로상위6개만조회
SELECT `trains`.`id` AS `id`, `types`.`name` AS `type`, `src_stn`.`name` AS `src_stn`, `dst_stn`.`name` AS `dst_stn`, 
    TIMEDIFF(`trains`.`arrival`, `trains`.`departure`) AS `travel_time` FROM `trains` 
    INNER JOIN `types` ON `trains`.`type`=`types`.`id`
    INNER JOIN `stations` AS `src_stn` ON `trains`.`source`=`src_stn`.`id` 
    INNER JOIN `stations` AS `dst_stn` ON `trains`.`destination`=`dst_stn`.`id`
    ORDER BY `travel_time` DESC LIMIT 6;

-- 각노선의열차종류(type),출발역(src_stn),도착역(dst_stn),출발시각(departure),도착시각(arrival), 운임(fare;원단위)을
-- 출발시각의오름차순으로모두조회
SELECT `types`.`name` AS `type`, `src_stn`.`name` AS `src_stn`, `dst_stn`.`name` AS `dst_stn`, `trains`.`departure` AS `departure`, 
    `trains`.`arrival` AS `arrival`, ROUND((`types`.`fare_rate`*.001)*(`trains`.`distance`), -2) AS `fare` FROM `trains` 
    INNER JOIN `types` ON `trains`.`type`=`types`.`id`
    INNER JOIN `stations` AS `src_stn` ON `trains`.`source`=`src_stn`.`id` 
    INNER JOIN `stations` AS `dst_stn` ON `trains`.`destination`=`dst_stn`.`id`
    ORDER BY `trains`.`departure`;

-- 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),최대좌석수(maximum)를
-- 노선의ID의오름차순으로모두조회(예매한사용자가없는노선은제외)
SELECT `trains`.`id` AS `id`, `types`.`name` AS `type`, `src_stn`.`name` AS `src_stn`, `dst_stn`.`name` AS `dst_stn`, 
    COUNT(`tickets`.`seat_number`) AS `occupied`, `types`.`max_seats` AS `maximum` FROM `trains` 
    INNER JOIN `types` ON `trains`.`type`=`types`.`id`
    INNER JOIN `stations` AS `src_stn` ON `trains`.`source`=`src_stn`.`id` 
    INNER JOIN `stations` AS `dst_stn` ON `trains`.`destination`=`dst_stn`.`id`
    INNER JOIN `tickets` ON `trains`.`id`=`tickets`.`train`
    GROUP BY `trains`.`id`;

-- 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),최대좌석수(maximum)를
-- 노선의ID의오름차순으로모두조회(예매한사용자가없는노선도포함)
SELECT `trains`.`id` AS `id`, `types`.`name` AS `type`, `src_stn`.`name` AS `src_stn`, `dst_stn`.`name` AS `dst_stn`, 
    COUNT(`tickets`.`seat_number`) AS `occupied`, `types`.`max_seats` AS `maximum` FROM `trains` 
    INNER JOIN `types` ON `trains`.`type`=`types`.`id`
    INNER JOIN `stations` AS `src_stn` ON `trains`.`source`=`src_stn`.`id` 
    INNER JOIN `stations` AS `dst_stn` ON `trains`.`destination`=`dst_stn`.`id`
    LEFT JOIN `tickets` ON `trains`.`id`=`tickets`.`train`
    GROUP BY `trains`.`id`;