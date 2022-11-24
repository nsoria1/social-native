#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    drop table if exists assets;
    drop table if exists asset_acquisition;
    drop table if exists asset_flow;
	create table if not exists assets (asset_id int, url varchar(50), width int, height int, type varchar(50));
    create table if not exists asset_acquisition (asset_acquisition_id int, asset_id int, acquisition_at timestamp, media_channel varchar(50));
    create table if not exists asset_flow (media_flow_id int, asset_id int, from_state varchar(50), to_state varchar(50), transition_at timestamp);
    INSERT INTO public.assets (asset_id, url, width, height, "type") VALUES(1, 'walmart.com', 10, 10, 'image');
    INSERT INTO public.assets (asset_id, url, width, height, "type") VALUES(2, 'amazon.com', 20, 20, 'video');
    INSERT INTO public.assets (asset_id, url, width, height, "type") VALUES(3, 'ebay.com', 30, 30, 'image');
    INSERT INTO public.assets (asset_id, url, width, height, "type") VALUES(4, 'mercadolibre.com', 20, 30, 'video');
    INSERT INTO public.asset_acquisition (asset_acquisition_id, asset_id, acquisition_at, media_channel) VALUES(1, 1, '2022-11-23 12:00:00', 'instagram');
    INSERT INTO public.asset_acquisition (asset_acquisition_id, asset_id, acquisition_at, media_channel) VALUES(2, 2, '2022-11-23 12:00:00', 'twitter');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(8, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(9, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(10, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(11, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(12, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(13, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(14, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(15, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(16, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(17, 1, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(18, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(19, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(20, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(21, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(22, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(24, 1, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(25, 1, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(26, 1, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(27, 1, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(28, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(29, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(30, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(31, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(32, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(33, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(34, 1, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(35, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(36, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(37, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(38, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(39, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(40, 1, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(41, 1, 'READY FOR TAGGING', 'REJECTED IN TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(42, 1, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(43, 1, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(43, 1, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(44, 1, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(45, 1, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');

    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(8, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(9, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(10, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(11, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(12, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(13, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(14, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(15, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(16, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(17, 2, 'COLLECTED', 'READY FOR MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(18, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(19, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(21, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(22, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(23, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(24, 2, 'READY FOR MODERATION', 'APPROVED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(25, 2, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(26, 2, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(27, 2, 'READY FOR MODERATION', 'REJECTED IN MODERATION', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(28, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(29, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(30, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(31, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(32, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(33, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(34, 2, 'APPROVED IN MODERATION', 'READY FOR TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(35, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(36, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(37, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(38, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(39, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(40, 2, 'READY FOR TAGGING', 'TAGGED', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(41, 2, 'READY FOR TAGGING', 'REJECTED IN TAGGING', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(42, 2, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(43, 2, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(43, 2, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(44, 2, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    INSERT INTO public.asset_flow (media_flow_id, asset_id, from_state, to_state, transition_at) VALUES(45, 2, 'TAGGED', 'RELEASED TO WIDGETS', '2022-11-23 12:00:00');
    drop table if exists sample;
    create table if not exists sample (media_channel varchar(50), collected int, moderated int, approved_in_mod int, tagged int, released_to_widget int);
    INSERT INTO public.sample (media_channel, collected, moderated, approved_in_mod, tagged, released_to_widget) VALUES('instagram', 1000, 984, 342, 311, 309);
    INSERT INTO public.sample (media_channel, collected, moderated, approved_in_mod, tagged, released_to_widget) VALUES('twitter', 252, 223, 41, 38, 36);
    INSERT INTO public.sample (media_channel, collected, moderated, approved_in_mod, tagged, released_to_widget) VALUES('tik tok', 758, 705, 280, 277, 270);
EOSQL