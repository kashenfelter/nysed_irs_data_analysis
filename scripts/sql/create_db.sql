# create database, note: no permissions done here
#create database nysed_irs;
use nysed_irs;

# create counties table
create table counties(
countyid int not null auto_increment primary key,
countyname text not null,
geometry text
);

# create districts table
create table districts(
districtid int not null auto_increment primary key,
districtname text not null,
countyid int not null,
foreign key (countyid) references counties(countyid)
);

# create needresourcecategories table
create table needresourcecategories(
needresourcecategoryid int not null auto_increment primary key,
needresourcecategoryname text not null
);

# create schooltypes table
create table schooltypes(
schooltypeid int not null auto_increment primary key,
schooltypename text not null);

# create gradeorganizations table
create table gradeorganizations(
gradeorganizationid int not null auto_increment primary key,
gradeorganizationname text not null
);

# create schools table with foreign keys to previously created tables
create table schools(
schoolid int not null auto_increment primary key,
schoolname text not null,
bedscode long not null,
enrollment int not null,
countyid int not null,
foreign key (countyid) references counties(countyid),
districtid int not null,
foreign key (districtid) references districts(districtid),
gradeorganizationid int not null,
foreign key (gradeorganizationid) references gradeorganizations(gradeorganizationid),
needresourcecategoryid int not null,
foreign key (needresourcecategoryid) references needresourcecategories(needresourcecategoryid),
schooltypeid int not null,
foreign key (schooltypeid) references schooltypes(schooltypeid)
);

# create eventtypes table
create table eventtypes(
eventtypeid int not null auto_increment primary key,
eventtypename text not null,
weaponrelated bool not null
);

# create schoolyears table
create table schoolyears(
schoolyearid int not null auto_increment primary key,
schoolyearstart int not null,
schoolyearname text
);

# create events table with foreign key
create table events(
eventid int not null auto_increment primary key,
eventcount int not null,
schoolyearid int not null,
foreign key (schoolyearid) references schoolyears(schoolyearid),
withweapon bool not null,
eventtypeid int not null,
foreign key (eventtypeid) references eventtypes(eventtypeid),
schoolid int not null,
foreign key (schoolid) references schools(schoolid)
);
