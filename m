From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 19:46:44 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133CA74.6070906@slaphack.com>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com> <20040829150041.GD9471@alias>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040829150041.GD9471@alias>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: flx@msu.ru
Cc: Hans Reiser <reiser@namesys.com>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander Lyamin wrote:
| Fri, Aug 27, 2004 at 11:28:51AM -0700, Hans Reiser wrote:
|
|>Rik van Riel wrote:
|>
|>
|>>
|>>Currently I see no way to distinguish between the stuff
|>>that should be backed up and the stuff that shouldn't.
|>>
|>>
|>>
|>
|>We create filename/pseudos/backup, and that tells the archiver what to
|>do.....
|
|
| its ugly idea.
|
| representations should be distinguished from sources. and its reasonably
| to put this distinguisher somewhere in namespace. but
filename/pseudos/backup
| is plain ugly.

How about filename/metas/serialized, or filename/metas/fschunk?

And I did mention before about how it'd be nice for it to be an fs chunk...

Imagine 5000 tiny little files that, by the time reiser's done with
them, fit inside 5 blocks or so.  It's insanely cheaper to copy the five
blocks than to tar them up.  It also means that we don't have to worry
about supporting tar on other platforms -- if they don't have reiser4,
they need a separate converter.  If apps are going to use reiser4
metadata for anything significant, they probably would link against some
sort of userland implementation of reiser4 as a Windows library, say, to
access the files elsewhere.

That's extreme, but you get the idea.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTPKc3gHNmZLgCUhAQJ5xw//T+kLDCHlfQEaGM9XAeFDZU9f4m4PWjet
n2xODVIxaT7WmnZ4nQ3rRTiJjsXvRBcPdWUTFRZl6NbLqa/K6ESpUJAZsZynRhXd
NLJ9gEpeqcUrXBLrmTD5AbzENOLdqDIo2qQ+hde68H5vo+naa5xtTyrMiHNHQWbf
9P45WKXYt36madg4KjAhZcYB+T843fc/ItjLQBTwxBNOykBcZ82UUNwGeGbiqczm
uXftCD6BNtKsXnJxu2jVc8CK93lOw4SIf7BY09PFXgK2XTpAsKzOwwqpBtdxSzqD
lkz+nGEeYZk6GRA3N1OTbPJnboee7WHZzMyvXDMBsExfR6puV1SYA2NWhj9uGDmS
nYNZwdN+RimiouD1D9DD+oCQe/Gr66THicex5FM37cMBdaDf0jGblvpDdQRfkhcX
2KGLCt1ax620ia2945/+/+6iQqM7+oTQsVNziYjVGQ4gCNRzZh8SBtM0yUZuecNO
H84fWYLICGos+Qk7FyCuQOquTSVRWKadkiDaOSre2hFk+S9VmDWkghJSNGrnqoKi
pFYFrUzL+NXPHs6G8b8EKAaQQt+Z8iHE6xgdc+yS56Pdrq8apRzeQv2zhgZaRq9J
kCRgvYo40xFMX4B+EqexxIiwc6nPUD5dFbt0OnJMEk4pduFq64lMVdoQA8Qp4X8a
0feuVuaWHr0=
=ymeH
-----END PGP SIGNATURE-----
