From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: 2004.08.13 Snapshot for 2.6.8[.1]
Date: Sat, 14 Aug 2004 18:47:27 +0200
Message-ID: <20040814164727.GA1826@raptus.homelinux.net>
References: <20040814165601.79260f07.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20288-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040814165601.79260f07.lists@mjh.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

hi,

On Sat, Aug 14, 2004 at 04:56:01PM +0200, Milan Holz=E4pfel - Personal repl=
y info see sig wrote:
>=20
> For those of you who want to use Reiser4 with a vanilla kernel: I have
> rediffed the yesterdays "official" snapshot from
> <URL:http://namesys.com/snapshots/2004.08.13/> against 2.6.8[.1]:
> <URL:http://linux.mjh.name/kernel/patches/reiser4/2004.08.13_2.6.8.1/>
>=20
> I had one compile error complaining about a missing attribute of the
> inode struct in reiser4/plugins/object.c:992, but since this seems to be
> sth. only present in the mm series but not used by Reiser4 outcommenting
> the line did the job for me. (Well according to the fixme beloning to it
> I probably should not have gotten it anyway...)
>=20

i have also made the same work, it is now in kernel-patch-2.6-reiser4
20040813-2 debian package.

i've also fixed the usual read_lock vs spin_lock & co warnings.

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
