From: Russell Coker <bofh@coker.com.au>
Subject: /proc/mounts and data=journal
Date: Thu, 19 Dec 2002 23:16:51 +0100
Message-ID: <200212192316.51412.bofh@coker.com.au>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

I've applied the patches for mounting with data=journal.  However one problem 
that I have discovered is that the data=journal status of a file system is 
not shown in /proc/mounts, other tunable options of a file system such as 
noatime are shown.

I think that this is a bug.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

