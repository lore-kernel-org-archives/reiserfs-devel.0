From: Clemens Schwaighofer <cs@tequila.co.jp>
Subject: Re: Filesystem Tests
Date: Thu, 07 Aug 2003 09:55:21 +0900
Message-ID: <3F31A379.2060807@tequila.co.jp>
References: <3F306858.1040202@mrs.umn.edu>	<20030805224152.528f2244.akpm@osdl.org>	<3F310B6D.6010608@namesys.com>	<20030806183410.49edfa89.diegocg@teleline.es>	<20030806180427.GC21290@matchmail.com> <20030806204514.00c783d8.diegocg@teleline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806204514.00c783d8.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Diego_Calleja_Garc=EDa?= <diegocg@teleline.es>
Cc: Mike Fedyk <mfedyk@matchmail.com>, reiser@namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Diego Calleja Garc=EDa wrote:

> El Wed, 6 Aug 2003 11:04:27 -0700 Mike Fedyk <mfedyk@matchmail.com>
escribi=F3:
>
>
>>Journaled filesystems have a much smaller chance of having problems
after a
>>crash.
>
> I've had (several) filesystem corruption in a desktop system with
(several)
> journaled filesystems on several disks. (They seem pretty stable these
days,
> though)

well, I only had one time huge problems with a journaling FS, this was
when I thought I could use Reise FS Beta on a Production File Server ;)

> However I've not had any fs corrution in ext2; ext2 it's (from my
experience)
> rock stable.

well, ever had a check of several hundrets of Gigabytes in ext2 after a
poweroutage ... when you had this several times in a row, you even take
ext3 and thank for its existence ...

> Personally I'd consider twice the really "serious" option for a
serious server.

I'd never use ext2 on a server anymore nowadays. You have so many
choises of stable journaling filesystems, you don't have to use ext2
anymore (except perhaps for small partitions like /tmp or /boot ...)

- --
Clemens Schwaighofer - IT Engineer & System Administration
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
Tequila Japan, 6-17-2 Ginza Chuo-ku, Tokyo 104-8167, JAPAN
Tel: +81-(0)3-3545-7703            Fax: +81-(0)3-3545-7343
http://www.tequila.jp
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/MaN5jBz/yQjBxz8RAqEDAJ9MZBTBokLsCxDQga3GVNHKY9q/3ACgpX2S
nIezpbMMsLb58jTnYnHI53w=3D
=3DfO1v
-----END PGP SIGNATURE-----

