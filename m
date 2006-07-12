From: Jeffrey Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Wed, 12 Jul 2006 01:52:50 -0400
Message-ID: <44B48E32.5080307@suse.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca> <44AED01C.60601@namesys.com> <44AFFD50.8070905@suse.com> <44B44856.5070409@suse.com> <44B48BC0.2000608@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B48BC0.2000608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Jan Kara <jack@suse.cz>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> You make this way too complicated because you are trying to be way too
> perfect.  If you scan 3 bitmap blocks and find nothing, stop trying to
> size match.

Agreed on the trying too hard. I think we can find a better, less
"perfect" solution. I wrote that email on Friday on my notebook and it
couldn't connect. It managed to do so this evening. I spent the weekend
experimenting with the idea, and while I came up with something that
worked, it wasn't really usable. The memory footprint was much too large
to be worthwhile. For some fragmentation patterns, it would work. The
worst case scenario was totally intolerable.

- -Jeff

- --
Jeff Mahoney
SUSE Labs

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEtI4xLPWxlyuTD7IRAh0uAJ4xqU2JFRUqgyQYDDQBr0oGBJBCXgCcCXD7
et36eQ8yUt3CD7e6+thPZvU=
=iFAe
-----END PGP SIGNATURE-----
