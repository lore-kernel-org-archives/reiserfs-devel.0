From: David Bernick <bernz@alpha.bernztech.org>
Subject: update on Re: slow stat() ?
Date: Wed, 10 Dec 2003 23:44:12 -0500 (EST)
Message-ID: <Pine.LNX.4.10.10312102341290.9203-100000@alpha.bernztech.org>
References: <3FCAF1F4.6040106@namesys.com>
Reply-To: bernz@bernztech.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCAF1F4.6040106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: reiserfs-list@namesys.com


Thought I'd update this issue:

I was using Kernel 2.4.22 with himem enabled and 4GB of hardware RAM. The
system was occasionally getting overloaded, especially with lots of stat()
syscalls. kupdated seemed to dominate the system during these parts. Very
frustrating.

I moved to kernel 2.4.23 after reading that the HIMEM section was greatly
improved and that seemed to solve my problem. 

Just thought I'd mention it.

