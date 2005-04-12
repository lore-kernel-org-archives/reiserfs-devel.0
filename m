From: David Masover <ninja@slaphack.com>
Subject: Re: Less disk space with reiser4?
Date: Mon, 11 Apr 2005 19:57:12 -0500
Message-ID: <425B1CE8.3090904@slaphack.com>
References: <425A8A1D.9040206@siwnet.net> <20050411195253.GD6211@backtop.namesys.com> <425ADC6C.8090209@namesys.com> <425AE170.7010806@nauticom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425AE170.7010806@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Chester R. Hosey" <chosey@nauticom.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chester R. Hosey wrote:
> Many filesystems claim degraded performance as free space decreases
> beyond a certain threshold. However, they often allow the user to exceed
> this point and accept the decline in performance.
> 
> While Alex's explanation does well to explain why a certain amount of
> free space is required in the case of a commit depending on a certain
> amount of free space, it doesn't quite show that 45 gigs are required to
> cover this requirement on a terabyte of space. Is this a reasonable
> requirement?

Not in my book.  Let me second this.

It's not all that expensive to build a terabyte array.  It's much more
expensive to build a box with 45 gigs of RAM.  People who can afford to
run Reiser4 on a box with 45 gigs of RAM can afford to hire you guys to
patch it.

I propose that the limit should be configurable, and modifiable online
or offline with some sort of tunefs command.  In fact, I propose that
the default should be 5% or the total RAM at time of creation, whichever
is lower.

What if the user upgrades RAM?  Change this value on mount, if the space
is available, and create a mount option to override this behavior.

Performance concerns should be addressed by printing a warning in dmesg,
somewhat like "flushing like mad".  And most filesystems suffer with
more than 75% full, so it's better to educate the users than just steal
a quarter of their space (or even a twentieth).

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlsc6HgHNmZLgCUhAQK0Zw/+PLX+CFKx0xPHXBZiyhjykbLcOk1YBfJz
tZ971xf3sE18hDbA3uEbuT6PkSvA5ihcICThk7wwUh9lM0HcN7epCmQqICRDBMl1
m5PJ/SlV4VEkbJEsevHmo1aFTY87c1WW9sk6gPWaHw10d7eGZqMMtuSXhHXOnJ3E
9/M4FZcJsUp/18Ur5e8SJvX5ach0LsYSnKL8vslv0uVaFCdr1lITGVLlztKh7j1n
/UUQiwuGCT1WvOrPjySEUm7Y+eeC0eXea763ll90ZjuhVGsaSCsorIVSmuAm06YO
VJC971hlkMOQJaYp7hduyiF8dskSHyQ4A76K+BArdo/tZdciRNlA/DAE3uG5GFKY
xNxWit5fv4wm96f/X1A1rIPhxOyWK4teP2n9G/1UK+5+uYgLTUqtG8tGZ1WNDysz
na5HgY2MwKXJQwlvLnABCDn4sFZV2amNd/r2//tcSZp6lM2gvXmoo4Velg4YMr2G
TnnlLNf96LOoHQFdZvaDyeXxkFO8WaHbDSA7ffhXbYLkSfNpd8eY/ocGOO8YF9Jn
mRmjecG4iveWg9y7I7DpQ5ofXEGVTYjH2d2Z+UnjN0D7mgm7x454rMgsjrLqHwL+
lsi116nLctIT63e3F9Eq3UQ/fI+QvfiyXXrDHec1oGBl3LFO8OuSGLsRr7GBbHfz
kY4pgD+GIJU=
=VhOT
-----END PGP SIGNATURE-----
