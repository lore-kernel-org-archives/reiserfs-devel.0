From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: usr/include/linux/reiserfs_fs.h is having lot of KERNEL data
Date: Tue, 20 Jan 2009 20:57:22 +0530
Message-ID: <1232465242.3088.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760815AbZATP1q@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

usr/include/linux/reiserfs_fs.h is giving 21 'make headers_clean' warnings:
 usr/include/linux/reiserfs_fs.h:64: leaks CONFIG_REISERFS to userspace where it is not valid
 usr/include/linux/reiserfs_fs.h:81: leaks CONFIG_REISERFS to userspace where it is not valid
 usr/include/linux/reiserfs_fs.h:687: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:995: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:997: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1467: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1587: leaks CONFIG_QUOTA to userspace where it is not valid
 usr/include/linux/reiserfs_fs.h:1760: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1764: extern's make no sense in userspace 
 usr/include/linux/reiserfs_fs.h:1766: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1769: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1771: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1805: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1908: leaks CONFIG_PROC to userspace where it is not valid
 usr/include/linux/reiserfs_fs.h:1948: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1949: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1950: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1951: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1962: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1963: extern's make no sense in userspace
 usr/include/linux/reiserfs_fs.h:1964: extern's make no sense in userspace

This file is huge and need lot of cleanup.

Anyone interested to fix this file.

Thanks,

--
JSR
