From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 19:16:22 +0400
Message-ID: <1149520582.6402.134.camel@tribesman.namesys.com>
References: <e61aht$7kf$1@sea.gmane.org>
	 <1149516737.6402.120.camel@tribesman.namesys.com>
	 <e61f4n$p6b$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28730-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e61f4n$p6b$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-06-05 at 16:29 +0200, Juergen Starek wrote:
> Vladimir V. Saveliev schrieb:
> > On Mon, 2006-06-05 at 15:11 +0200, Juergen Starek wrote:
> >
> >> I have noticed that if I put my ~ on a ReiserFS partition, Pan (GNOME's
> >> newsreader) starts very slowly, [...]
> >=20
> > Probably Pan is stat(2)-ing whole cache. Can you please try to find out
> > what Pan is doing on start? Strace(1) may help.
>=20
> You're right, I straced Pan's start process and after initialization, it
> seems to call stat64 on every message in its cache. This is a snippet of
> the trace, produced on an ext3 filesystem (line length exceeds 80 chars):=
=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> stat64("/home/jstarek/.pan/gmane", {st_mode=3DS_IFDIR|0755, st_size=3D409=
6, ...}) =3D 0
> stat64("/home/jstarek/.pan/Standard", {st_mode=3DS_IFDIR|0755, st_size=3D=
4096, ...}) =3D 0
>=20
> stat64("/home/jstarek/.pan/messages/cache", {st_mode=3DS_IFDIR|0755, st_s=
ize=3D1032192, ...}) =3D 0
> open("/home/jstarek/.pan/messages/cache", O_RDONLY|O_NONBLOCK|O_LARGEFILE=
|O_DIRECTORY) =3D 6
> fstat64(6, {st_mode=3DS_IFDIR|0755, st_size=3D1032192, ...}) =3D 0
> fcntl64(6, F_SETFD, FD_CLOEXEC)         =3D 0
> getdents64(6, /* 62 entries */, 4096)   =3D 4096
> stat64("/home/jstarek/.pan/messages/cache/42b4e3b2$0$1128$9b4e6d93@newsre=
ad4.arcor-online.net.msg", {st_mode=3DS_IFREG|0644, st_size=3D1426, ...}) =
=3D 0
> time(NULL)                              =3D 1149517138
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The last two calls of this trace snippet are then repeated for all files
> in the cache.
>=20
> > If Pan is doing millions of stats for files from cache - that explains
> > why it starts slowly when cache is stored on reiserfs.
>=20
> Could you please explain this? An URL with the explanation is fine, too --
> I just don't have experience with file systems...
>=20

reiserfs does not store inodes as compact as ext3. It allocates inodes
dynamically. As result reiserfs inodes get spread over whole filesystem.
Also reiserfs tries to store file bodies in the same block as file's
inode. As result one reiserfs block usually contains inodes than ext[23]
inode block does.
So, to stat each file of directory reiserfs has to perform more disk
reads and to do more disk head seek than a filesystem which stores
inodes compactly in preallocated disk area.=20

> Thanks,
>=20
>   J=C3=BCrgen
>=20
>=20

