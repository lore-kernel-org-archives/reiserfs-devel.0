From: Paul Wagland <paul@wagland.net>
Subject: Re: Reiserfs concurrent write problems
Date: Sat, 1 May 2004 11:26:41 +0200
Message-ID: <A7BF88B4-9B51-11D8-B804-000A95CD704C@wagland.net>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca> <1083088841.30344.131.camel@watt.suse.com> <20040430195405.GB23648@em.ca>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-8--130297057"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040430195405.GB23648@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

--Apple-Mail-8--130297057
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed


On Apr 30, 2004, at 21:54, Bruce Guenter wrote:

> On Tue, Apr 27, 2004 at 02:00:41PM -0400, Chris Mason wrote:
>> Good to hear, could I trouble you to ping me (or better yet
>> reiserfs-list) when you have the graphs updated?
>
> I've updated the benchmarking web page to include the new results from
> the 2.6.6-rc2-mm2 kernel:
> 	http://untroubled.org/benchmarking/2004-04/

One interesting thing that I noticed is that all of the other 
filesystems have had major performance regressions on most of the tests 
as compared to the gentoo kernel.

I.e.
                2.6.6-rc2-mm2   Gentoo-2.6.5
ext2 1wr del:  70.537          45.716
ext2 16wr del: 647.679         580.760
xfs 1wr del:   14.388          16.216
xfs 16wr del:  308.173         122.987

I am very curious as to how the Gentoo kernel does against the stock 
kernel, i.e. whether or not this is a mainline regression, or whether 
Gentoo has an added patch or two that helps things out somehow.

Cheers,
Paul

--Apple-Mail-8--130297057
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAk21Stch0EvEFvxURAi8HAJwNLsNJENx4DNzF004YkSAAS+PfGQCfePLB
7W2i/hhaQcC/9ICTxTsnEso=
=usFa
-----END PGP SIGNATURE-----

--Apple-Mail-8--130297057--

