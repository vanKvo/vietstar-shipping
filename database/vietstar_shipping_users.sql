SET FOREIGN_KEY_CHECKS=0;
-- Dumping data for table `user`
INSERT INTO `user` (`id`, `username`, `name`, `password`, `position`) VALUES
(1, 'admin', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin'),
(2, 'guest', 'Guest', '84983c60f7daadc1cb8698621f802c0d9f9a3c3c295c810748fb048115c186ec', 'admin'),
(3, 'employee1', 'Employee 1', '36cdfcec47d26e934f3b0c0b9ca761bbe09fae6d37581ab2e4bb4a52b66623ab', 'employee'),
(4, 'employee2', 'Employee 2', 'e5dc127f9f0a1c2ce3d61e6321670602931f1d50c43abfb9b004594bd283d878', 'employee');

SET FOREIGN_KEY_CHECKS=1;
