From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 22:55:04 -0500
Message-ID: <41354818.6020307@slaphack.com>
References: <185110393004-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <185110393004-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:
[...]
| A file type would tell us that a file is a text file and can be opened
| by certain applications (text/e-mail can be opened by e-mail reader,
| text editor, etc) and have other properties (lists of standard
| attributes, default icon).  A plugin ID says that the file can use text
| related plugins (like a word count, or XML structure as a subdirectory).
|
| In both cases there is a global repository (I assume) that associates
| the file type or plugin ID with a list of things about it.

I'm not sure how automatic this is.  Standard things like directories,
block devices, files, symlinks, and so on are all separate plugins.

Other than that, it doesn't seem so automatic.  I have to explicitly
turn on encryption, but I can do it to any kind of file or directory --
assuming the cryptocompress plugin worked yet.

[...]
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTVIGHgHNmZLgCUhAQKzGg//U3bd6yn4LtArriZY5ldBtEah37MidQMR
SZC+jljIdNdwVap2H5m9dC8P4UbN6FLV/3ZVx4K/sel+E35oSM5QWhGyL0DMsTXw
M2irNqwDzLQr7iY7tOm0sqmAc1vMHjyk+w50tIQ0Kjbe6n4Rg3e9ZPf9iPvhJxx2
tlYcGlqcoJ8C1hfI0yHHWTZIx63TE4eOTDgZ7n2EkmI+23STOmRTKrPT7QXQPgPV
0eaC+xSUVcF+78KBTfg1j4nq4OVdgNUS0dbyfHqKZBwUn76zcfHz6aVwFKLOaMNH
lZ+jzpWYykIFhol/HJOmzO8W7GQfHnpKLNC2rDAlh7eKbCdo7mk2WvyDU/ObSenr
fYyhrDwdUG/WKzAa6WySOWuMnABB16mHiUggc2qMcqkyrkCfwq7X13Ryjis0cmCJ
mkIKZWglZaHZUbOOBKrXnT9zyd8T1DfmxwJ7eg66xnk0m5gQfMYk0Yg6z0VQ6KYv
AmBAkRV70YnC87rVTINN4byqMfTWyySu9EqiKaH0STXFNR/cBA87comIOYp0JPZ8
blCfIR5dIw8e5iPEUhPE623qKT4ljKmiw+xJZcbOczi0dymlXQOagJXE0/NH4IdK
vwBgHUhtoxFWxsDeGW4xEF+mE8YLjXJC5AIxvFIdlOv3N27rvm3w1dPwensj5uFC
iFCQ80xftW8=
=2vbH
-----END PGP SIGNATURE-----
