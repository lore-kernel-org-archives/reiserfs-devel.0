From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: Reiser4: errors AFTER fsck
Date: Fri, 4 Apr 2008 22:50:16 +0200
Message-ID: <200804042250.17577.volker.armin.hemmann@tu-clausthal.de>
References: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de> <47F68DAD.5010305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F68DAD.5010305@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

On Freitag, 4. April 2008, Edward Shishkin wrote:
> Volker Armin Hemmann wrote:
> >Hi,
> >
> >I have /var on reiser4 with compression plugin. /var contains the us=
ual
> > stuff + gentoo portage tree + kernel-sources.
> >
> >An hour ago I wanted to emerge --sync, which failed. I got fs errors=
=2E
>
> What exactly was wrong with emerge?
> Did you access to compressed reiser4 partition via nfs?

I tried emerge --sync and got this error:
 Traceback (most recent call last):  File "/usr/bin/emerge", line 6971,=
 in=20
<module>    retval =3D emerge_main()  File "/usr/bin/emerge", line 6647=
, in=20
emerge_main    if portage._global_updates(trees, mtimedb["updates"]): =20
=46ile "/usr/lib64/portage/pym/portage.py", line 9786, in _global_updat=
es   =20
update_data =3D grab_updates(updpath, prev_mtimes) =20
=46ile "/usr/lib64/portage/pym/portage_update.py", line 76, in grab_upd=
ates   =20
mylist =3D os.listdir(updpath)OSError: [Errno 5] Input/output=20
error: '/var/portage/profiles/updates'

I tried:
 ls /var/portage/profiles/ls: lese Verzeichnis /var/portage/profiles/:=20
Eingabe-/Ausgabefehler

reading directory /var/... Input/Output error.=20

A look into dmesg (I am sorry that I didn't saved it, just a small copy=
 I sent=20
to a fried) showed this:

4012.521107] WARNING: reiser-2018: Too many iterations. Tree corrupted,=
 or=20
(less likely) starvation occurring.: level: 5, lock_level: 1, stop_leve=
l: 1=20
lock_mode: read, bias: exact[ 4012.526541] reiser4[zsh(11860)]: travers=
e_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.526543] WARNING: Too many=
=20
iterations: 128[ 4012.526918] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.526920] WARNING: Too many=
=20
iterations: 256[ 4012.527684] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.527686] WARNING: Too many=
=20
iterations: 512[ 4012.529157] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.529158] WARNING: Too many=
=20
iterations: 1024[ 4012.532065] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.532066] WARNING: Too many=
=20
iterations: 2048[ 4012.537740] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.537741] WARNING: Too many=
=20
iterations: 4096[ 4012.549302] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.549303] WARNING: Too many=
=20
iterations: 8192[ 4012.572442] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.572444] WARNING: Too many=
=20
iterations: 16384[ 4012.618816] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.618818] WARNING: Too many=
=20
iterations: 32768[ 4012.713004] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.713006] WARNING: Too many=
=20
iterations: 65536[ 4012.901022] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4012.901024] WARNING: Too many=
=20
iterations: 131072[ 4013.274457] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4013.274459] WARNING: Too many=
=20
iterations: 262144[ 4013.949374] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:722)[nikita-373]:[ 4013.949376] WARNING: reiser-20=
18:=20
Too many iterations. Tree corrupted, or (less likely) starvation occurr=
ing.:=20
level: 5, lock_level: 1, stop_level: 1 lock_mode: read, bias: exact[=20
4013.949879] reiser4[zsh(11860)]: traverse_tree (fs/reiser4/search.c:68=
9)
[nikita-1481]:[ 4013.949880] WARNING: Too many iterations: 128[ 4013.95=
0271]=20
reiser4[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-148=
1]:[=20
4013.950272] WARNING: Too many iterations: 256[ 4013.951042] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.951043] WARNING: Too many iterations: 512[ 4013.952581] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.952582] WARNING: Too many iterations: 1024[ 4013.955636] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.955637] WARNING: Too many iterations: 2048[ 4013.961710] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.961711] WARNING: Too many iterations: 4096[ 4013.973735] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.973737] WARNING: Too many iterations: 8192[ 4013.998142] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4013.998144] WARNING: Too many iterations: 16384[ 4014.046829] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4014.046831] WARNING: Too many iterations: 32768[ 4014.143775] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4014.143777] WARNING: Too many iterations: 65536[ 4014.338003] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4014.338004] WARNING: Too many iterations: 131072[ 4014.726141] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:689)[nikita-1481]:[=20
4014.726142] WARNING: Too many iterations: 262144[ 4015.414323] reiser4
[zsh(11860)]: traverse_tree (fs/reiser4/search.c:722)[nikita-373]:[=20
4015.414325] WARNING: reiser-2018: Too many iterations. Tree corrupted,=
 or=20
(less likely) starvation occurring.: level: 5, lock_level: 1, stop_leve=
l: 1=20
lock_mode: read, bias: exact[ 4015.419684] reiser4[zsh(11860)]: travers=
e_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.419686] WARNING: Too many=
=20
iterations: 128[ 4015.420062] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.420064] WARNING: Too many=
=20
iterations: 256[ 4015.420792] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.420794] WARNING: Too many=
=20
iterations: 512[ 4015.422220] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.422221] WARNING: Too many=
=20
iterations: 1024[ 4015.425125] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.425127] WARNING: Too many=
=20
iterations: 2048[ 4015.430834] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.430836] WARNING: Too many=
=20
iterations: 4096[ 4015.442255] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.442256] WARNING: Too many=
=20
iterations: 8192[ 4015.465017] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.465018] WARNING: Too many=
=20
iterations: 16384[ 4015.509976] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.509977] WARNING: Too many=
=20
iterations: 32768[ 4015.598852] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.598854] WARNING: Too many=
=20
iterations: 65536[ 4015.776638] reiser4[zsh(11860)]: traverse_tree=20
(fs/reiser4/search.c:689)[nikita-1481]:[ 4015.776640] WARNING: Too many=
=20
iterations: 131072


and no, I don't use nfs, smb or any other 'fancy' stuff.

/var isn't even very full:

/dev/sda6              20G  6,4G   14G  33% /var

but it does contain the portage tree and all kernel sources (/usr/src i=
s just=20
a symlink).=20

>
> >I rebooted into busybox and did fsck.reiser4 /dev/sda6
> >
> >It ran and told me that  --build-fs was needed.
> >
> >So I ran it. It fixed lots of stuff (mostly lenght correction) and p=
ut 222
> >files into lost+found.
> >
> >After boot, I tried to access some of the files there, to figure out=
 what
> > I lost:
> >
> >[  566.765093] reiser4[ls(4761)]: key_warning
> >(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
> >[  566.765094] WARNING: Error for inode 248375 (-2)
> >[  566.765109] reiser4[ls(4761)]: key_warning
> >(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
> >[  566.765111] WARNING: Error for inode 248373 (-2)
> >[  566.765125] reiser4[ls(4761)]: key_warning
> >(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
> >[  566.765127] WARNING: Error for inode 248374 (-2)
>
> Uhm.. fsck created inaccessible lost+found..

not everything is inaccessible - the old stuff from earlier fsck runs=20
still 'works'. But yes, the 'new' stuff is corrupt.

> Would you please pack your metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz

I did it with the partition mounted, I hope that does no have a negativ=
e=20
impact?

The file is here:
http://rapidshare.com/users/M56DNW

http://rapidshare.com/files/104900271/meta.gz

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
