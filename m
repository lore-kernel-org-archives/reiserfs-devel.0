From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiser4] sub_from_sb_unallocated - error [zam528]
Date: Wed, 6 Nov 2002 21:29:58 +0300
Message-ID: <15817.24486.129650.130074@laputa.namesys.com>
References: <slrnasin32.45l.andreashappe@marvin.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <slrnasin32.45l.andreashappe@marvin.homelinux.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Happe <andreashappe@gmx.net>
Cc: reiserfs-list@namesys.com

Andreas Happe writes:
 > my computer crashed while copying a kernel tree from a reiserfs to a
 > reiser4 partition with the following message:
 > 
 > | Kernel panic: reiser4 panicked cowardly: <0> reiser4 [(pdflush(7)]:
 > | sub_from_sb_unallocated (fs/reiser4/block_alloc.c:161) [zam-528]
 > 
 > there are no new files on the reiser4 partition.
 > 
 > i'm using debian unstable, kernel 2.5.46 with reiser4 patch from
 > 5.11.2002.

Thank you for report. This bug is known. We are working on it right now.
I hope it will be fixed in the next snapshot.

 > 
 > Andreas
 > 
 > 

Nikita.
