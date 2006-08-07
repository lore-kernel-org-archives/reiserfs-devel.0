From: David Masover <ninja@slaphack.com>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled
 fs, looks stable to me...)
Date: Mon, 07 Aug 2006 13:09:42 -0400
Message-ID: <44D773D6.4020504@slaphack.com>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060807092435.GA11596@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Christian Trefzer wrote:
> On Sun, Aug 06, 2006 at 04:23:16PM +0200, Maciej So=C5=82tysiak wrote:

>> There also is an issue with grub. The kernel alone is fine for creating =
partitions
>> (or loop devices) but with grub not patched we can't install boot partit=
ions. No biggy,
>> I guess, but still a problem.
>=20
> Few people keep a 32MB ext2 for /boot purposes these days, so it really
> is imperative that grub can read kernel images off a reiser4 /.

I think there are patches, but I do keep a 32 meg ext3 for /boot,=20
because it seems like no matter what FS I choose, there's some sort of=20
caveat involving Grub.  I know when installing XFS as a root FS on=20
Ubuntu, it talks about Grub problems...

I mean, having Grub support everything would be nice, but if you're=20
reformatting anyway, I don't think it's that imperative.
