From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 06 Sep 2004 13:53:13 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413CB219.5030800@slaphack.com>
References: <200409061814.i86IEcPJ005086@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200409061814.i86IEcPJ005086@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Horst von Brand wrote:
| Spam <spam@tnonline.net> said:
|
| [...]
|
|
|>  The problem with the userspace library is standardization. What
|>  would be needed is a userspace library that has a extensible plugin
|>  interface that is standardized. Otherwise we would need lots of
|>  different libraries, and I seriously doubt that 1) this will happen
|>  and 2) we get all Linux programs to be patched to use it.
|
|
| What is the difference with a kernel implementation? Not by being
in-kernel
| will it make all the incompatible ways of doing this magically vanish, and
| give outstanding performance. Plus handling and maintaining the in-kernel
| stuff is _much_ harder than userspace libraries.

First of all, only the interface has to be in the kernel.  I haven't
heard anyone suggest otherwise.

Second, there are quite a few things which I might want to do, which can
be done with this interface and without patching programs, but would
require massive patches to userspace.  There have been numerous examples.

There are some things which can't be solved without patching.  Version
control is one such thing.  But then there can be more generic patches
- -- as soon as the transaction API is done, you only have to patch apps
to use that, and have a version control reiser4 plugin.

| I'd go the other way around: Get userspace to agree on a common framework,
| make it work in userspace; if (extensive, hopefully) experience shows that
| a pure userspace solution has issues that can't be solved except by kernel
| assistance, so be it.

We already have such a framework -- it's called "VFS".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTyyGXgHNmZLgCUhAQLUeQ/8D3tWL9l/zQeGylpVbOe6SkcSPOOmlIFR
tcjh0y1Y4ET17ATFKbKbzQYYDgd49AqU/gZnro27jYun3Yi6U0fWGGQFfi1A9O5E
gSCmsjSWjfDfx4gu3EU1x0Bhkd6Mo8GCrC7L5gj5C+L4c5ZAnffeGloF8nM4hCex
Wsb0PgOSxXuoQcd2EELVEXYdq0RCnxrmuszl1B2SE6w1ImONWMoXJ9fDGDf0aIUu
rwrrZnlH4zp0bQ0dXDGXqUYYT5h5DAhbh96IWLrPbWMB0vLBqIP+95P2/vTHb7EL
RwVKBV1UuuZ2ANPbImoIuxHWF+PCx/HwFs/mUolw0D2Yn3u2HgmPVFemyPnlCfeX
yGPhJgnieRuGntgUZcfbqk7ZO3y0y5eRDq6N4eMHMlWYV9LC5kyP7OxcQ8SAF8P6
Sk4iylYN1AMiy5Bp9odScauST0NT9CLmi1Ps0DYwgVN1H+ldS1l+4ITokb1Ex1+4
ZLq1HhPNaYYWoA4VPuwxl0XrB4wGrMbOt1w4+TNM3AG9MvzqTGgSrh2rXfXkPHGZ
7LNHuinRyJt3dcF0vPS4WHG6FtVsO8XVPaY55tYQIYZEBtZl3mattBb9gM3WDJmw
M/pxbAQTDZHloR9/7TGEF8gD3AjPBexTfvojqVHK2VvRu4/2Ku17wvK82v68LuyU
bFxxxgj9IgY=
=BxAT
-----END PGP SIGNATURE-----
