From: David Masover <ninja@slaphack.com>
Subject: Re: The Necessity of File Types (was silent semantic changes with
 reiser4)
Date: Mon, 30 Aug 2004 19:42:03 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133C95B.8080307@slaphack.com>
References: <3632837631-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <3632837631-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, torvalds@osdl.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:
[...]
| By the way, I disagree on Hans with using a directory for the meta
data, I'd prefer to just have "..meta." as the name prefix of the
metadata things.  Otherwise there's an extra directory level in there,
making ..meta/ different from other directories (making browsing it a
bit awkward since it doesn't have metadata of its own - like window
coordinates for displaying the directory).

You'd rather do "cat ..meta.pseudo" than "ls ..metas/"?
And we already have weird directories.  /proc doesn't do things that
/tmp does.  I also doubt proc will ever store that kind of metadata.

I don't like either "metas" or "..metas", but you'll have to look in the
archives for why.  I am NOT starting that again.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTPJW3gHNmZLgCUhAQKuEw/+PjrDfSlZvuTUwiOSa/kU05qjTKkIp05F
nBkrSIUKSUfoYN3gILucIGOjjJ5qBRW3wLIwWyO+raOAzHFTdylvR1rEWP9h/JUG
Psz3X8RE8cubiuNwjyJawI87cPX8HW1xQxgkiiquZN2L5XbvHsFsbwAJV1tJLnrM
2lL6IBUXcxDIh7pdB0/z+4t945ElT3Rl09CLP/MfP4GNvt/UWjhbeHNWdeLq93C+
w0irn6VIsm+1+GKqEhpYLLMj9V4cbBY6m7XMuBzH+gEyu5exAMqGzPLGDiG/I6y/
rXI6IF94i2p4sLMv0LmtEvQsV37LFIKRBrWVScV5oiQ93LPVLG6pYmAi6RLsHN03
QazMmcRwjVvrTAf0KS21KXaE0qYbvgoQpteUEkPZLRkczSmiry2d3e6gBQlCV7xj
9Hzkm9HxR0BjxmRaMVLEWZ86t08OHkl0Ab186DiHUC5RlL2FPIvdyYthXo9wwtI/
XlA03Rvc3kl6DVRO8UM/+fa8v5MDn58ZMI2QgdPrU0V2Q9bGv/woByszXaDA+IVJ
ZiHQ8IgShYlkA279DffOrZnDPnZMOWa7iRYetX5PYPoAyfkrmFKofT8va+dDL7pf
HA5crUR5ws1EZZ8lUfrtXXnsBeEn9PS0lUHvJY7zZ4tJfZ65Fa+IiDpK5p+1tJZi
ylCBNEidK/8=
=CiZ9
-----END PGP SIGNATURE-----
