From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Reiser4 on SuSE 9.1
Date: Fri, 4 Jun 2004 16:47:32 +0200
Message-ID: <200406041647.32645.marcel@hilzinger.hu>
References: <200406041414.HAA14660@amber.he.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406041414.HAA14660@amber.he.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Mike Young <myoung@wildernessvoice.com>

2004. j=FAnius 4. 16.14 d=E1tummal Mike Young ezt =EDrta:
> Has anyone put Reiser4 on the latest SuSE 9.1 release?  I'd like to use it
> there without having to patch a pristine kernel.  Preferably, I'd like to
> be able to use their RPM build environment so I can continue to take
> updates from SuSE.

Probably this is not, what you need, but I test Reiser4 on SuSE 9.1 with=20
kernel 2.6.5. This is NOT a SuSE kernel, but I use the config file form the=
=20
official SuSE 2.6.4 kernel and it compiled without problems. Even cryptoloo=
p=20
with the old SuSE twofish works. Of course kernel update will not work any=
=20
more...

I tried to patch the SUSE kernel with reiser4 patches, but as I'm just a=20
stupid user, I couldn't make it work. It would be great, if the SuSE kernel=
=20
developers could make a patch for the SuSE 9.1 kernels.=20

This would also be good for namesys, as with this help much more tester cou=
ld=20
be won for testing Reiser4. As I'm a user, I know, that many users have tim=
e=20
to do such tests, and they don't bother about data anyway :-)

Marcel


=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger

