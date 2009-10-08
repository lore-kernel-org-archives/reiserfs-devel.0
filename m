From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] reiserfs: Truncate blocks not used by a write (v2)
Date: Fri, 9 Oct 2009 10:11:34 +1100
Message-ID: <20091009101134.b9549de9.sfr@canb.auug.org.au>
References: <1253121912-20718-1-git-send-email-jack@suse.cz>
	<20090916144815.e544b319.akpm@linux-foundation.org>
	<20090917005633.GC8098@nowhere>
	<20090917115629.6f8f8f00.sfr@canb.auug.org.au>
	<20091008124818.GB5073@nowhere>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Oct_2009_10_11_34_+1100_a3yX3TXVqx9ViQAY"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933330AbZJHXMX@vger.kernel.org>
In-Reply-To: <20091008124818.GB5073@nowhere>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, hch@infradead.org, reiserfs-devel@vger.kernel.org, jeffm@suse.com

--Signature=_Fri__9_Oct_2009_10_11_34_+1100_a3yX3TXVqx9ViQAY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Thu, 8 Oct 2009 14:48:24 +0200 Frederic Weisbecker <fweisbec@gmail.com> =
wrote:
>
> Now that -rc1 has been released (well.. -rc2, or..hmm...), could you plea=
se
> reintegrate the tree:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
> 	reiserfs/kill-bkl
>=20
> into -next ?

Done.  (Boilerplate below in case you missed out last time.)

> It is based on linux-2.6.31, I haven't merged 32-rc3 into
> it because there is no conflict between those and there are no
> dependencies against latest changes.

That should be fine.

> Tell me if you need something. It's possible there are pending
> patches in reiserfs for .33 in -next which might conflict, I don't
> know. But if you need help to fix the conflicts, just tell me.

You will hear :-)

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Fri__9_Oct_2009_10_11_34_+1100_a3yX3TXVqx9ViQAY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrOcaYACgkQjjKRsyhoI8yUKgCgi/Wlv8LCVCcXMo7MSEgQh58g
AagAnRy9FRfqy/md7XV+cimiPuTheTcB
=aDKk
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Oct_2009_10_11_34_+1100_a3yX3TXVqx9ViQAY--
