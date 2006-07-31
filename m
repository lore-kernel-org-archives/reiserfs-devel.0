From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 22:57:34 +0200
Message-ID: <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
	<200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29328-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Cc: matthias.andree@gmx.de, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


> > Great to see that Sun ships a state-of-the-art Filesystem with
> > Solaris... I think linux should do the same...
>=20
> This would be worthwhile, if only to be able to futz around in Solaris-ma=
de
> filesystems.

s/I think linux should do the same/I think linux should include Reiser4/
 ;-)


> First question is if there are any restrictions (patent or otherwise) on
> doing this,

Quoting from
 http://it.sun.com/eventi/jc06/pdf/mi27_p5_poccia_virtualization.pdf

=AD> 47 ZFS patents added to CDDL patent commons

But i'd rather like to see a Linux version of WAFL :-)

ZFS didn't really impress me:=20
The Volume-Manager is nice but the Filesystem.. well: It beats UFS .. somet=
imes ;-)

See also: http://spam.workaround.ch/dull/postmark.txt

A quick'n'dirty ZFS-vs-UFS-vs-Reiser3-vs-Reiser4-vs-Ext3 'benchmark'



Regards,
 Adrian
