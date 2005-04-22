From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Error messages while moving files to reiser4 fs
Date: Fri, 22 Apr 2005 14:46:02 +0400
Message-ID: <1114166762.3975.445.camel@tribesman.namesys.com>
References: <20050422064825.GA1528@localhost.localdomain>
	 <1114159400.3975.412.camel@tribesman.namesys.com>
	 <4268CF0C.6080407@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4268CF0C.6080407@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com, damien.wyart@free.fr

Hello

On Fri, 2005-04-22 at 14:16, Laurent Riffard wrote:
> Le 22.04.2005 10:43, Vladimir Saveliev a =E9crit :
> > Hello
> >
> > On Fri, 2005-04-22 at 10:48, Damien Wyart wrote:
> >
> >>Hello,
> >>
> >>While moving some iso images from a jfs partition to a reiser4 one (very
> >>recently created with latest reiser4progs), I got a bunch of errors
> >>looking like these :
> >>
> >>Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_i=
node+0x45/0x51
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_bal=
ance_dirty_pages+0x94/0xd4 [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_wri=
te_flow+0x4bf/0x6dc [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_e=
xtent+0xf/0x1a [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_exte=
nt+0x0/0x4f [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and=
_or_overwrite+0x198/0x39e [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow=
+0x8f/0x95 [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file=
+0x96/0xc0 [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix=
_file+0x23a/0x48c [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_wr=
ite+0x8f/0xff [reiser4]
> >>Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x=
153
> >>Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
> >>Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_p=
ast_esp+0x52/0x75
> >>Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_i=
node+0x45/0x51
> [snip]
>=20
> Where do those ext3_write_inode come from ? Aren't they strange ?
>=20
>=20

No. That stack trace does not have to be precisely correct. I guess that
routine which prints it merely tries to convert binary data it finds on
a stack to function names and offsets within those functions.=20

On the other hand, there could be something like:
extent_balance_dirty_pages->balance_dirty_pages->writeback_inodes->sync_sb_=
inodes->generic_sync_sb_inodes->
__writeback_single_inode->__sync_single_inode->write_inode->ext3_write_inode



> >>I do not know at all what they mean... I stupidly reformatted the
> >>partition without doing a fsck :( so I can't provide much more
> >>information, I'm afraid.
> >
> >
> > Can you reproduce this problem?
> > did you do: cp /tmp_jfs/* /tmp_reiser4/?
> >
> >
> >>What I do not get is why some messages appear
> >>to be related to ext3.
> >
> >
> > reiser4 calls balance_dirty_pages()->writeback_inodes() which deals with
> > inodes of other mounted filesystems.
> >
> >
> >> My root fs is ext3-formatted ; here are my df
> >>output :
> >>
> >>/dev/sdb2     ext3    1.4G  456M  874M  35% /
> >>/dev/sdb5 reiserfs    3.5G  3.2G  291M  92% /usr
> >>/dev/sdb6 reiserfs     15G  6.1G  8.6G  42% /home
> >>/dev/sdb7 reiserfs    4.9G   33M  4.9G   1% /tmp
> >>/dev/sdb8      jfs    9.8G  7.7G  2.2G  79% /tmp_jfs
> >>/dev/sdb9      xfs    9.8G  6.6G  3.2G  68% /tmp_xfs
> >>/dev/sdb11 reiser4    3.4G  236K  3.4G   1% /tmp_reiser4
> >>
> >>The system is vanilla 2.6.11.7 with reiser4 patch from ftp.namesys.com.
>=20
> ~~
> laurent
>=20

