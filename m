From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Tue, 15 Jul 2003 21:55:09 +0200
Message-ID: <200307152155.09716.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307151848.59027.Dieter.Nuetzel@hamburg.de> <20030715170540.GA1213@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030715170540.GA1213@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Am Dienstag, 15. Juli 2003 19:05 schrieb Oleg Drokin:
> Hello!
>
> On Tue, Jul 15, 2003 at 06:48:58PM +0200, Dieter N?tzel wrote:
> > !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> >!!!!!!!!!!!!!!!!! The 'right' questions are:
> > * Are the 204,804 MB really needed?
>
> In reiserfs - yes.
>
> > * How many space do XFS, JFS and ext3 'use'?
>
> ext2 uses 16 kb for me (4k blocksize)
>
> > * When the above three can do it a 1000 times faster why can't we?
>
> We can, only in case of reiserfs we have nasty races if we do that.
> Or may be not. I have something to discuss around, I guess ;)
>
> > * Do the three other do it right?
>
> I do not know.
>
> > Removing of the sparse files can take horrible amount of time.
>
> Does the patch below helps?

Somewhat.
Mouse movement is OK, now. But...

NSTALL/SOURCE> l
insgesamt 1032
drwxrwxr-x    2 root     root          176 Jul 15 21:45 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm

INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.000u 3.090s 0:16.81 18.3%     0+0k 0+0io 153pf+0w
0.000u 0.050s 0:00.27 18.5%     0+0k 0+0io 122pf+0w

INSTALL/SOURCE> sync
INSTALL/SOURCE> time dd if=/dev/zero of=sparse1 bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.000u 3.010s 0:15.27 19.7%     0+0k 0+0io 153pf+0w
0.000u 0.020s 0:01.01 1.9%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> sync
INSTALL/SOURCE> time dd if=/dev/zero of=sparse2 bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.000u 2.760s 0:15.16 18.2%     0+0k 0+0io 153pf+0w
0.000u 0.030s 0:00.85 3.5%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> sync
INSTALL/SOURCE> l
insgesamt 615444
drwxrwxr-x    2 root     root          248 Jul 15 21:46 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm
-rw-r--r--    1 nuetzel  users    214748364801 Jul 15 21:46 sparse
-rw-r--r--    1 nuetzel  users    214748364801 Jul 15 21:46 sparse1
-rw-r--r--    1 nuetzel  users    214748364801 Jul 15 21:47 sparse2

INSTALL/SOURCE> time rm sparse2 ; time sync
0.000u 4.930s 0:04.88 101.0%    0+0k 0+0io 130pf+0w
0.000u 0.010s 0:00.02 50.0%     0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time rm sparse1 ; time sync
0.000u 4.950s 0:04.87 101.6%    0+0k 0+0io 130pf+0w
0.000u 0.030s 0:00.05 60.0%     0+0k 0+0io 122pf+0w

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSTALL/SOURCE> time rm sparse ; time sync
0.000u 14.990s 1:31.15 16.4%    0+0k 0+0io 130pf+0w
0.000u 0.030s 0:00.22 13.6%     0+0k 0+0io 122pf+0w

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

> > If I 'create' a second sparse file with the same name over an existing
> > one (overwrite) I get the 1000 times speedup!
>
> Hm. Interesting observation.

Unchanged.

INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.000u 2.750s 0:15.31 17.9%     0+0k 0+0io 153pf+0w
0.010u 0.050s 0:00.93 6.4%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 205836
drwxrwxr-x    2 root     root          200 Jul 15 21:52 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm
-rw-r--r--    1 nuetzel  users    214748364801 Jul 15 21:52 sparse

INSTALL/SOURCE> sync
INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.000u 0.030s 0:00.03 100.0%    0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 205836
drwxrwxr-x    2 root     root          200 Jul 15 21:52 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm
-rw-r--r--    1 nuetzel  users    214748364801 Jul 15 21:53 sparse

> > Chris and Oleg what do you need?
> > SYSRQ-P/M?
>
> I guess I need additional pair of brains ;)
> Also some time that I can spend thinking about all of this.
> I guess I'd have plently of it in the Saturday, while flying to Canada.
> Only I won't be able to do any experiments. Sigh.
>
> Bye,
>     Oleg
>
> ===== fs/reiserfs/stree.c 1.22 vs edited =====
> --- 1.22/fs/reiserfs/stree.c	Tue Jun 24 11:30:22 2003
> +++ edited/fs/reiserfs/stree.c	Tue Jul 15 20:57:09 2003
> @@ -1773,6 +1773,8 @@
>  	  journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
>  	  reiserfs_update_inode_transaction(p_s_inode) ;
>  	}
> +	if ( current->need_resched )
> +	    schedule();
>      } while ( n_file_size > ROUND_UP (n_new_file_size) &&
>  	      search_for_position_by_key(p_s_inode->i_sb, &s_item_key,
> &s_search_path) == POSITION_FOUND )  ;

Good night!
	It's summer now;-)
					Dieter

