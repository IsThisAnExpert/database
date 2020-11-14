CREATE TABLE `user` (
  `id` bigint(42) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tweet` (
  `id` bigint(42) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `user_id` bigint(42) NOT NULL,
  `posted_time` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0: normal, 1:retweet',
  `user_screen_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `retweet` (
  `id` bigint(42) NOT NULL,
  `retweeted_by` bigint(42) NOT NULL,
  `source_tweet_id` bigint(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `credibility` (
  `id` bigint(42) NOT NULL,
  `score` float NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'manually chosen or calculated',
  `user_id` bigint(42) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credibility`
--
ALTER TABLE `credibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweet`
--
ALTER TABLE `retweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retweeted_by` (`retweeted_by`),
  ADD KEY `source_tweet_id` (`source_tweet_id`);

--
-- Indexes for table `tweet`
--
ALTER TABLE `tweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for table `credibility`
--
ALTER TABLE `credibility`
  MODIFY `id` bigint(42) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credibility`
--
ALTER TABLE `credibility`
  ADD CONSTRAINT `credibility_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `retweet`
--
ALTER TABLE `retweet`
  ADD CONSTRAINT `retweet_ibfk_2` FOREIGN KEY (`retweeted_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `retweet_ibfk_3` FOREIGN KEY (`source_tweet_id`) REFERENCES `tweet` (`id`),
  ADD CONSTRAINT `retweet_ibfk_4` FOREIGN KEY (`id`) REFERENCES `tweet` (`id`);

--
-- Constraints for table `tweet`
--
ALTER TABLE `tweet`
  ADD CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
