From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Sat, 04 Sep 2004 00:37:59 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413954B7.7050502@slaphack.com>
References: <200409032145.i83LjdXG002843@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200409032145.i83LjdXG002843@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Dave Kleikamp <shaggy@austin.ibm.com>, Paul Jakma <paul@clubi.ie>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jamie Lokier <jamie@shareable.org>, Linus Torvalds <torvalds@osdl.org>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Horst von Brand wrote:
[...]
| Use an editor that knows about encrypted files. Decrypt/edit/encrypt if no

You use emacs.  I use vim.  My brother uses gedit.  My parents use
abiword.  Perhaps I should patch them all?  If that was so easy, why is
there cryptoloop/dm-crypt?

| is rare. FS plugins are kernel modules, AFAIU, and are subject to the same
| problems.

Actually, FS plugins currently cannot be modules.  They are currently
called "plugins" because they share some concepts with browser plugins,
and it sounds great in marketing.

| If you can't find concrete uses for specific plugins, they are the
| proverbial solution searching for a problem.

Fine, let them be.  They are just very well structured code.  If you use
reiser4 and don't look in the source or the "metas" dir, they are
completely invisible to you.  I used the betas for months, and "metas"
never burned me.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTlUt3gHNmZLgCUhAQJVGhAAki5RLZckm5jiZnw7MXQLqURBvm+cz7wU
eFPfGyOE0SpFKJLFntWr0zrAgyK5ClgwqB7wsJEldWUfGBPdYpH5lroOQEHVEGBs
4X+ze/xyUOL6z3S07a85jNibYamDeoCDc5P0Vc6GWrdpsU7FQGXrHykNyglDxFJ1
MiYEQkB8NYDzQukl+7HPR3qPhQpAl5hx3XtmOcC5w0/88ATMqXg81DoVzPAPlsrL
IPu4ai7KjXRaY1sKo8SU4orj7iQHmmkiFJJg+QwVU9sO2GMBGpXZRSr3KcUL3ux5
nr+++ceVXyLADZaJRYp5LoTxL0KPJUKhaa9ABLmN2zQ5hT/v6AlQmKKD3s6ca02a
A8MQxy69hG50RVSeJm9yjRYQQBvATEXslCQXPXSAlLJGrPZ1FZgQdYyo2wNboD23
ep+JP2qTPdyTFFl2TOtoeR7fIsjg6DF5Bq0uh0maqC0UXXIo1GRO/OQGsNMfCN88
pevDg0GvE+bdeL8CEZYfDzu4aaUs+ltzZSPEKlXHCGFORL9iSuYhqdUCRPbcKYOy
uyhE7fgZoPYsOZLfChmXllEF69Cs5Vm5R0ymIgHqprfAjfqYf4ypbU0fukFDQ5dS
GGFTfxketTHdhYr7ATAfZg08ZMP819UnvcwISflLlDBwvpL4BDAWOrnDFnbHSugk
lPAxyPnfECM=
=h24Y
-----END PGP SIGNATURE-----
