From: "jenn sirp" <sirpj@ecs.csus.edu>
Subject: reiserfs_add_entry()
Date: Sat, 27 Mar 2004 15:44:53 -0800
Message-ID: <001501c41455$810487f0$4a28a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I was hoping this would be a fairly easy question for you guys to answer. I
have been altering the code in namei.c, the function: reiserfs_add_entry.
(version 3.6)Which apparently updates the directory entry.  I have noticed
that when a file is written. This function is actually called four times. Is
this by reiser code or by the kernel?

A .swp is made, then a .swx, then the actual file, and another .swp. I am
curious as to what is going on here. Are these temporary buffers that are
related to the journal? -- Or is the kernel controlling this behavior?

Thanks,

Jenn

