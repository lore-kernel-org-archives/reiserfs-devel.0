From: Pierre Abbat <phma@webjockey.net>
Subject: "Permission denied" during ls
Date: Fri, 26 Mar 2004 10:12:34 -0500
Message-ID: <200403261012.34806.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

A few months ago I set up a mail server for my ISP and put the maildirs on a 
separate disk formatted in reiserfs. I just got a call saying that he's 
getting "permission denied" errors doing "ls" on the directory:

[root@mail mail]# vdir
mupli@example.com: Permission denied
eg@example.com: No such file or directory
drwx------ postfix postfix muster@example.com
drwx------ postfix postfix naprimer@example.com

The box is running Linux 2.4.20 and AFAIK reiserfsck has never been run on 
that disk. What could cause this, and is it likely to need anything more than 
reiserfsck --check?

phma
-- 
li fi'u vu'u fi'u fi'u du li pa
