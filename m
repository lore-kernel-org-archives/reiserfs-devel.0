From: Chris Worley <chrisw@lnxi.com>
Subject: Re: Permission denied on access to files; even as
	root
Date: Sun, 16 Jun 2002 17:35:54 +0000 (UTC)
Message-ID: <1024354235.21004.10629.camel@xserver>
References: <1024353028.26879.10577.camel@xserver> 
	<3D0CC8F8.9090206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D0CC8F8.9090206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Lots of lines like:

	bad_stat_data: 4377 is shared by at least two files

and:

	shrink_id_map: objectid map shrinked: used 4096, 5 blocks

A few:

    bad_stat_data: 960450 is marked free, but used by an object 37421
    960450 0x0 SD

and:

	grow_id_map: objectid map expanded: used 10240, 10 blocks

It's not finished yet.  It's the root partition so it's doing it in
read-only mode.

I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
(using 3.5.x disk format...ReiserFS version 3.6.25) atop
lvm-1.0.0.2_rc2-6.  I upgraded reiserfs after a disk crash
last xmas (with a few remnants of that catastrophe still in the system).

I was trying to convert the file system for large files last week, and
wound up deciding that my reiser tools and the kernel patch are not in
sync.

The problem is progressive.  I.e. "/bin/hostname" can't be executed
today, and it was fine after trying the "conv".

Chris

On Sun, 2002-06-16 at 11:20, Yury Umanets wrote:
> Chris Worley wrote:
> 
> >I've got a couple hundred files that seem to be in a bad state since I
> >tried (unsuccessfully) converting my file system, for example (as root):
> >
> >/usr/bin # ls -l gdb
> >ls: gdb: Permission denied
> >/usr/bin # mv gdb gdb.bak
> >mv: cannot stat `gdb': Permission denied
> >/usr/bin # chmod a+r gdb
> >chmod: getting attributes of `gdb': Permission denied
> >
> >Any idea what has happened and how to recover these files?
> >
> It means that your filesystem is corrupted. Probably statdata item of 
> gdb. Have you tried to fsck it? What did fsck say?
> 
> >
> >Thanks,
> >
> >Chris
> >
> >
> >
> >  
> >
> 
> 
> 


