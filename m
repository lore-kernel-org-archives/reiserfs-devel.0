From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 16:49:33 +0100
Message-ID: <200402161649.33592.Dieter.Nuetzel@hamburg.de>
References: <4030391F.5080204@lig.net> <200402161506.51895.Dieter.Nuetzel@hamburg.de> <1076941748.2482.1249.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076941748.2482.1249.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, "Stephen D. Williams" <sdw@lig.net>

Am Montag, 16. Februar 2004 15:29 schrieb Chris Mason:
> On Mon, 2004-02-16 at 09:06, Dieter N=FCtzel wrote:
> > INSTALL/SOURCE> time rm sparse
> > 0.000u 10.684s 2:15.11 7.9%     0+0k 0+0io 0pf+0w
> >
> > 'rm' time is lost in 'io_schedule' and 'down'.
>
> Dieter, could you please try with this (shamefully untested and
> uncompiled) patch:
>
> --- linux.test/fs/reiserfs/stree.c.1	2004-02-16 09:26:33.643567752 -0500
> +++ linux.test/fs/reiserfs/stree.c	2004-02-16 09:27:24.166887040 -0500
> @@ -1754,7 +1754,7 @@
>  	  reiserfs_update_sd(th, p_s_inode) ;
>
>  	  journal_end(th, p_s_inode->i_sb, orig_len_alloc) ;
> -	  journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
> +	  journal_begin(th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 5) ;
>  	  reiserfs_update_inode_transaction(p_s_inode) ;
>  	}
>      } while ( n_file_size > ROUND_UP (n_new_file_size) &&


INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1
1+0 Records ein
1+0 Records aus
0.000u 2.984s 0:05.74 51.9%     0+0k 0+0io 1pf+0w

INSTALL/SOURCE> l
insgesamt 430288
drwxrwxr-x    7 root     root          264 2004-02-16 16:42 .
drwxr-xr-x    3 root     root           72 2004-01-12 13:53 ..
drwxr-xr-x    2 nuetzel  users         856 2003-12-27 14:51 bench
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk-3-7-2=
003
drwxr-xr-x    2 root     root          168 2004-02-14 00:49 NX
=2Drw-r--r--    1 nuetzel  users    214748364801 2004-02-16 16:42 sparse
=2Drw-r--r--    1 root     root     440604456 2004-02-15 08:45=20
ut2004-lnx-demo-3120.run
drwxr-xr-x   15 nuetzel  users         392 2004-01-17 04:24 viewperf-6.1.2

INSTALL/SOURCE> time sync
0.000u 0.061s 0:00.41 14.6%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> time rm sparse
0.000u 4.483s 0:04.48 100.0%    0+0k 0+0io 0pf+0w

Mouse behavior is the same.

With compilation in the "background":

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1
1+0 Records ein
1+0 Records aus
0.000u 2.707s 0:10.30 26.2%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> l
insgesamt 430288
drwxrwxr-x    7 root     root          264 2004-02-16 16:47 .
drwxr-xr-x    3 root     root           72 2004-01-12 13:53 ..
drwxr-xr-x    2 nuetzel  users         856 2003-12-27 14:51 bench
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk-3-7-2=
003
drwxr-xr-x    2 root     root          168 2004-02-14 00:49 NX
=2Drw-r--r--    1 nuetzel  users    214748364801 2004-02-16 16:48 sparse
=2Drw-r--r--    1 root     root     440604456 2004-02-15 08:45=20
ut2004-lnx-demo-3120.run
drwxr-xr-x   15 nuetzel  users         392 2004-01-17 04:24 viewperf-6.1.2

INSTALL/SOURCE> time sync
0.000u 0.015s 0:01.05 0.9%      0+0k 0+0io 0pf+0w

INSTALL/SOURCE> time rm sparse
0.000u 4.546s 0:04.86 93.4%     0+0k 0+0io 0pf+0w

Thanks,
	Dieter
=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
