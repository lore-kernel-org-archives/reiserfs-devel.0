From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 snapshot
Date: Mon, 11 Aug 2003 20:55:44 +0400
Message-ID: <16183.51856.591552.209707@laputa.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	<3F37C738.9060806@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F37C738.9060806@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Carl-Daniel Hailfinger writes:
 > Nikita Danilov wrote:
 > > Hello,
 > > 
 > > new reiser4 snapshot is available at 
 > > 
 > > http://thebsh.namesys.com/snapshots/2003.08.11/
 > 
 > +config REISER4_LARGE_KEY
 > +	bool "Use larger keys on reiser4 tree"
 > +	depends on REISER4_FS
 > +	default y
 > +	---help---
 > +      Make keys larger and use additional bits to order bodies of files
 > within
 > +      a directory in the order of their names, which is what you want
 > +      normally. If you turn this off, file bodies will be ordered by creation
 > +      time, which is not optimal for most users.
 > +
 > +      Warning: flipping this option makes your file system binary
 > +      incompatible.
 > 
 > This needs some explanation. What happens if I have two reiser4 fs on my
 > disk, one written with REISER4_LARGE_KEY, the other one without? Does it
 > prevent me from mounting both filesystems at the same time? If so, will

Right.

 > this change some time?
 > 

Not likely. Supporting both key assignment algorithms costs too much at
run time. Probably small keys will be just obsoleted.

 > 
 > Thanks,
 > Carl-Daniel
 > 

Nikita.
