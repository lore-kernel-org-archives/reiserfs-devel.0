From: Pat Shuff <shuff@tamu.edu>
Subject: ? file system basics
Date: Mon, 14 Oct 2002 09:38:35 -0500
Message-ID: <5.1.0.14.0.20021014092309.00b90148@neo.tamu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


This is going to sound like a basic question but here goes....

I want to take a single disk and allow it to shrink or grow. It appears 
that I can do this with ext2 and parted or reiserfs and 
cfdisk/resize_reiserfs by first managing the partition allocation then the 
file system that fills that partition. It also appears that the growing 
requires that the partition has empty space adjacent to the existing 
partition. Is there a utility that allows you to skip sections of the disk 
or map partitions and file systems across multiple partitions? For example, 
I want to take scsi disk 0 and divide it into three partitions sd0a, sd0b, 
and sd0e. I know how to put a file system on sd0a and grow it if there is 
space between sd0a and sd0b. Is there a way to grow this file system across 
to partition sd0e without using something like veritas volume management or 
LVM?

If I change this strategy and want to take two disks on the same system and 
lay a file system across these disks, can reiserfs handle this or do I 
first need to use a volume manager and lay the file system across the 
volume and not partitions on the two disks. Again, can I grow and shrink 
the partition allocation and file system as needed? Does the 
resize_reiserfs handle this or do I need to do this in conjunction with the 
volume manager?

If I take this a step farther and use iscsi or network block device (nbd) 
to access disks across the network, can I use reiserfs by itself or in 
combination with a volume manager to create a file system that can shrink 
or grow as needed? Are there limitations on this strategy or drawbacks that 
would keep me from using this technique?

pat


