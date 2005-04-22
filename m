From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: Error messages while moving files to reiser4 fs
Date: Fri, 22 Apr 2005 12:16:44 +0200
Message-ID: <4268CF0C.6080407@free.fr>
References: <20050422064825.GA1528@localhost.localdomain> <1114159400.3975.412.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB07DB783229F8E63D0F98A1C"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1114159400.3975.412.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com, damien.wyart@free.fr

--------------enigB07DB783229F8E63D0F98A1C
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Le 22.04.2005 10:43, Vladimir Saveliev a =E9crit :
> Hello
>
> On Fri, 2005-04-22 at 10:48, Damien Wyart wrote:
>
>>Hello,
>>
>>While moving some iso images from a jfs partition to a reiser4 one (very
>>recently created with latest reiser4progs), I got a bunch of errors
>>looking like these :
>>
>>Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_ino=
de+0x45/0x51
>>Apr 22 07:31:48 brouette kernel:  [pg0+955208632/1069118464] extent_balan=
ce_dirty_pages+0x94/0xd4 [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955209911/1069118464] extent_write=
_flow+0x4bf/0x6dc [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955199673/1069118464] nr_units_ext=
ent+0xf/0x1a [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955210889/1069118464] write_extent=
+0x0/0x4f [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955274160/1069118464] append_and_o=
r_overwrite+0x198/0x39e [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955274821/1069118464] write_flow+0=
x8f/0x95 [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955275498/1069118464] write_file+0=
x96/0xc0 [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955276110/1069118464] write_unix_f=
ile+0x23a/0x48c [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [pg0+955095464/1069118464] reiser4_writ=
e+0x8f/0xff [reiser4]
>>Apr 22 07:31:48 brouette kernel:  [vfs_write+236/339] vfs_write+0xec/0x153
>>Apr 22 07:31:48 brouette kernel:  [sys_write+81/128] sys_write+0x51/0x80
>>Apr 22 07:31:48 brouette kernel:  [sysenter_past_esp+82/117] sysenter_pas=
t_esp+0x52/0x75
>>Apr 22 07:31:48 brouette kernel:  [ext3_write_inode+69/81] ext3_write_ino=
de+0x45/0x51
[snip]

Where do those ext3_write_inode come from ? Aren't they strange ?


>>I do not know at all what they mean... I stupidly reformatted the
>>partition without doing a fsck :( so I can't provide much more
>>information, I'm afraid.
>
>
> Can you reproduce this problem?
> did you do: cp /tmp_jfs/* /tmp_reiser4/?
>
>
>>What I do not get is why some messages appear
>>to be related to ext3.
>
>
> reiser4 calls balance_dirty_pages()->writeback_inodes() which deals with
> inodes of other mounted filesystems.
>
>
>> My root fs is ext3-formatted ; here are my df
>>output :
>>
>>/dev/sdb2     ext3    1.4G  456M  874M  35% /
>>/dev/sdb5 reiserfs    3.5G  3.2G  291M  92% /usr
>>/dev/sdb6 reiserfs     15G  6.1G  8.6G  42% /home
>>/dev/sdb7 reiserfs    4.9G   33M  4.9G   1% /tmp
>>/dev/sdb8      jfs    9.8G  7.7G  2.2G  79% /tmp_jfs
>>/dev/sdb9      xfs    9.8G  6.6G  3.2G  68% /tmp_xfs
>>/dev/sdb11 reiser4    3.4G  236K  3.4G   1% /tmp_reiser4
>>
>>The system is vanilla 2.6.11.7 with reiser4 patch from ftp.namesys.com.

~~
laurent


--------------enigB07DB783229F8E63D0F98A1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFCaM8UUqUFrirTu6IRArC0AKCOo8OgTLjoq+RyeEXjK2Rif8aUTQCguady
/GJQGo7tBIpKM+tZUlbjVcM=
=aDOu
-----END PGP SIGNATURE-----

--------------enigB07DB783229F8E63D0F98A1C--
