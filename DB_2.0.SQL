-- Tables related to Users

CREATE TABLE `doctor` (
  `registration_no` int(11) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `full_name` varchar(200),
  `hospital_id` int(11),
  `contact_no` varchar(10)
);

CREATE TABLE `medical_officer` (
  `registration_no` int(11) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `full_name` varchar(200),
  `hospital_id` int(11),
  `contact_no` varchar(10)
);

CREATE TABLE `users` (
  `nic_no` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100),
  `email` varchar(255) NOT NULL,
  `user_type` varchar(20)
);

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
);

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255),
  `description` varchar(255)
);


CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255),
  `description` varchar(255)
);


CREATE TABLE `role_user` (
  `user_id` varchar(10) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
);


CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
);


-- Tables related to geographical data

CREATE TABLE `district` (
  `district_name` varchar(50) NOT NULL,
  `population` bigint(20) DEFAULT NULL
);


CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL
);

-- Tables related to Epidemics

CREATE TABLE `epidemy` (
  `scientific_name` varchar(200) NOT NULL,
  `doctor_nic` varchar(10) DEFAULT NULL,
  `add_date` date DEFAULT NULL
);


CREATE TABLE `symptoms` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `symptom` varchar(1000) DEFAULT NULL
);


CREATE TABLE `causes` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `cause` varchar(1000) DEFAULT NULL
);


CREATE TABLE `treatments` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `treatment` varchar(1000) DEFAULT NULL
);


CREATE TABLE `commom_names` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `commom_name` varchar(200) DEFAULT NULL
);


-- statistics


CREATE TABLE `statistics` (
  `epidemy_name` varchar(200) NOT NULL,
  `stat_year` int(11) NOT NULL,
  `stat_month` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `recorded_patients` int(11) DEFAULT NULL,
  `casualties` int(11) DEFAULT NULL,
  `medical_officer_nic` varchar(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL
);



-- CONSTRAINTS

-- geographical

ALTER TABLE `district`
  ADD PRIMARY KEY (`district_name`);

ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`),
  ADD KEY `district` (`district`),
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`district`) REFERENCES `district` (`district_name`);


-- Users
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`nic_no`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

ALTER TABLE `medical_officer`
  ADD PRIMARY KEY (`nic_no`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD CONSTRAINT `medical_officer_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);


ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`nic_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`nic_no`) ON DELETE CASCADE ON UPDATE CASCADE;





-- Epidemics
ALTER TABLE `epidemy`
  ADD PRIMARY KEY (`scientific_name`),
  ADD KEY `doctor_nic` (`doctor_nic`),
  ADD CONSTRAINT `epidemy_ibfk_1` FOREIGN KEY (`doctor_nic`) REFERENCES `doctor` (`nic_no`);

ALTER TABLE `symptoms`
  ADD KEY `epidemy_name` (`epidemy_name`),
  ADD CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`);

ALTER TABLE `causes`
  ADD KEY `epidemy_name` (`epidemy_name`),
  ADD CONSTRAINT `causes_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`);

ALTER TABLE `treatments`
  ADD KEY `epidemy_name` (`epidemy_name`),
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`);

ALTER TABLE `commom_names`
  ADD KEY `epidemy_name` (`epidemy_name`),
  ADD CONSTRAINT `commom_names_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`);

ALTER TABLE `statistics`
  ADD PRIMARY KEY (`epidemy_name`,`stat_year`,`stat_month`,`hospital_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `medical_officer_nic` (`medical_officer_nic`),
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`),
  ADD CONSTRAINT `statistics_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  ADD CONSTRAINT `statistics_ibfk_3` FOREIGN KEY (`medical_officer_nic`) REFERENCES `medical_officer` (`nic_no`);

