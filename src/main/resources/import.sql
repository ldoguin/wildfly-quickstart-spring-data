--
-- JBoss, Home of Professional Open Source
-- Copyright 2015, Red Hat, Inc. and/or its affiliates, and individual
-- contributors by the @authors tag. See the copyright.txt in the
-- distribution for a full listing of individual contributors.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- http://www.apache.org/licenses/LICENSE-2.0
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

-- You can use this file to load seed data into the database using SQL statements
INSERT INTO default (KEY, VALUE) VALUES ("0", { "name": "John Smith", "email": "john.smith@mailinator.com", "phone_number": "2125551212", "address":"Boston NY","_class": "org.jboss.as.quickstart.springdata.couchbase.model.Member"}) RETURNING *
INSERT INTO default (KEY, VALUE) VALUES ("1", { "name": "Madhumita Sadhukhan", "email": "msadhukh@gmail.com", "phone_number": "2135551214", "address":"Brno CZ","_class": "org.jboss.as.quickstart.springdata.couchbase.model.Member"}) RETURNING *