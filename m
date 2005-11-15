From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 19:04:00 +0100
Message-ID: <437A2310.7080508@free.fr>
References: <200511111359.39715.jgilmore@glycou.com>	 <200511120906.39109.jgilmore@glycou.com>	 <1131997263.10816.56.camel@teratron.lan.etheus.net>	 <200511142147.07787.chrivers@iversen-net.dk> <1132064829.8002.9.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132064829.8002.9.camel@teratron.lan.etheus.net>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le 15.11.2005 15:27, Craig Shelley a =E9crit :
> On Mon, 2005-11-14 at 21:47 +0100, Christian Iversen wrote:
>=20
>>That's _serisouly_ odd. I've seen something like this happen before, when=
 X=20
>>programs generated some (non-harmful) X warnings. These were then written=
=20
>>into a log file, typically .xsession-errors or similar. Any chance that's=
=20
>>what you are seeing?
>>
>=20
> This explains the problem with Evolution, it looks a bit trigger happy
> with the fsync call while resizing columns.
> craig@teratron.lan.etheus.net:~$ strace -p 8002 2>&1 | grep fsync
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0
> fsync(37)                               =3D 0

Please, could you do it again with the -T option for strace? It will
show the time spent in system  calls.

> while true; do lsof  -p 8002 2>&1 | grep 37w ; done
> evolution 8002 craig   37w   REG        3,4     417
> 1901436 /mnt/storage/craig-home/.evolution/mail/views/.#custom_view-mbox:=
_home_craig_.evolution_mail_local#Lists_Reiser4.xmlwhile=20
>=20
> The file listed above seems to get moved, but is only a few hundred
> bytes.
>=20
> ls -lh /mnt/storage/craig-home/.evolution/mail/views/custom_view-mbox
> \:_home_craig_.evolution_mail_local#Lists_Reiser4.xml
> -rw-------  1 craig craig 417 2005-11-15
> 14:19 /mnt/storage/craig-home/.evolution/mail/views/custom_view-mbox:_hom=
e_craig_.evolution_mail_local#Lists_Reiser4.xml
>=20
> Why does calling fsync on this one small file cause so much hard disk
> activity?




