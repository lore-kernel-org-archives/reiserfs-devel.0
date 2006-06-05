From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 18:12:17 +0400
Message-ID: <1149516737.6402.120.camel@tribesman.namesys.com>
References: <e61aht$7kf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e61aht$7kf$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-06-05 at 15:11 +0200, Juergen Starek wrote:
> Hello everyone,
>=20
> I hope this is the right mailing list for my question, if not, please
> redirect me.
>=20
> I have noticed that if I put my ~ on a ReiserFS partition, Pan (GNOME's
> newsreader) starts very slowly, taking about 75 seconds. If I move the
> same article cache onto an ext3 partition, Pan starts in less than 10
> seconds. This confuses me, as I've read a lot of benchmarks and comments
> on the net which indicate that ReiserFS is faster than ext3 when handling
> lots of small files.
>=20
> Pan's article cache consists of lots of small files (approx. 70 MB, each
> file has only a few kilobytes) and, on my system, it should not be
> fragmented too much because I copied the files from an external source
> onto the empty volume.
>=20

Probably Pan is stat(2)-ing whole cache. Can you please try to find out
what Pan is doing on start? Strace(1) may help.
If Pan is doing millions of stats for files from cache - that explains
why it starts slowly when cache is stored on reiserfs.

> Asking this question on the German Linux newsgroup
> de.comp.os.unix.linux.misc[1] didn't lead to any hints about diagnosing
> this behaviour. Any ideas?=20
>=20
> Many thanks in advance
>=20
>   J=C3=BCrgen
>=20
> [1]
> http://groups.google.de/group/de.comp.os.unix.linux.misc/browse_thread/th=
read/d60014be503abebd/
>=20
>=20

