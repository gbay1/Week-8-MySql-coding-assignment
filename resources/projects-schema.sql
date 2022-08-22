use  projects;
drop table if exists project_category;
drop table if exists category;
drop table if exists step;
drop table if exists material;
drop table if exists project;

create table project (
project_id int auto_increment not null,
project_name varchar(128) not null,
estimated_hours decimal(7,2) null,
actual_hours decimal(7,2) null,
difficulty int null,
notes text null);

create table material (
material_id int auto_increment not null,
project_id int not null,
material_name varchar(128) not null,
num_required int null,
cost decimal(7,2) null
);

create table step (
step_id int auto_increment not null,
project_id int not null,
step_text text not null,
step_order int not null
);

create table category (
category_id int auto_increment not null,
category_name varchar(128) not null
);

create table project_category (
project_id int  not null auto_increment,
category_id int not null auto_increment,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES project (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, cateogry_id)
);