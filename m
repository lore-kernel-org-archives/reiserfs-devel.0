From: David Masover <ninja@slaphack.com>
Subject: Re: shrink reiserfs
Date: Sat, 29 Jan 2005 18:42:48 -0600
Message-ID: <41FC2D88.7010703@slaphack.com>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>       <20050123171105.GG10921@backtop.namesys.com>       <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>       <20050123190735.GH10921@backtop.namesys.com>       <18682.62.135.89.53.1106507496.squirrel@mail.infinitylimited.net>       <20050123194918.GI10921@backtop.namesys.com>       <20050123212315.GK10921@backtop.namesys.com>    <18958.62.135.89.53.1106517199.squirrel@mail.infinitylimited.net>    <41F64DA7.2070502@nauticom.net> <33095.1.0.10.1.1106927577.squirrel@www.infinitylimited.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <33095.1.0.10.1.1106927577.squirrel@www.infinitylimited.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jake@infinitylimited.net
Cc: Chet Hosey <chosey@nauticom.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jake Hawkes wrote:
[...]
|  - reboot after every step, to check that you haven't messed something up,
| especially if after writing a new partition, fdisk say "Kernel will
| continue to use old partition table".

Only if that happens.  And it will only happen if you are using the disk
in question, so...

[...]
|  - always have an alternative boot media handy (I use the gentoo live CD)

I'd use it in the first place, to avoid having to reboot after fdisk.
And I'd use cfdisk.  Less chance for mistakes.

|  - be very familiar (ie, dont rely on man pages or web pages) with your
| tools, especially resize_reiserfs, grub, mount etc

It's good to have such documentation available, whether or not you know
resize_reiserfs by heart.  The important thing is to train yourself to
always look at the doc, and never guess, especially when a typo can mean
your disk.

| End Result: good so far.  I haven't completely finished yet, still to do
| are finalising the grub install, and creating the new FAT partition to
| share data between windows and linux.

I'm curious why windows would be needed on a laptop.  I only use it for
games.  But maybe your laptop is better than mine.

And btw, when I mess with my laptop partitions, I usually tar up
everything and dump it to my desktop.  Just make sure the boot cd has
ethernet support.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQfwth3gHNmZLgCUhAQJTlRAAiL1GrZ0qAAQUmreveCM+AgtMoifecDgR
AyPE4gv6Ah7MUsb7QluDdnGXe83YDqhnJEdIm67Iaxie0zVKWb7F5utQgzrBV7lg
oY7aE7UpS1c6wQ9cNkUnfYIq4gc851J8kSTG+vO/sZIkvAxg+zp/dz/ZQa1ED+6u
WxwFNkoXNq60DYg8taseVFJiy9E6jN1aM+DPsrvitgKfnjfC5xGXT62yST/So5Ua
+RJTQTh+UANps3T+tubZsp/+OcH9V+mFXgGXX985ABWUjG1KX6HPSnjttkIhvvIS
X+KNyXjJTH/QKW/r9xeNYXafV359GwRxxHZJuxesq8cofh5PYLg5p98FwxLHUbiY
iI7pqJpDDkm4JHAa0k6c2EZyh02Iaj5vb9RbDK9p9kPSCke0cXYeyExAnCVOUDtf
agNDpkC2Q9Nm+s0AsxkJX1BiLB0hGz54NAbJvfIHhxF/PgmTVCEOGjDNWoc0cAll
uwc7OZK9Jv96ybuaxeDmNlLLz0iy8dK4lAh3VKw6vIA565fYGhAqFopwfcU3axqK
VMTcnfq4BrmVWQnZXdX2OPPuSwss7cbYbdjoV5So8U0X5/V62QeJhGskvm8prJA9
7n/ebxGnGGQt++u8B9gIlRuT+ndZcj01k4/y3YM9Yw/inOF8bSHCjPF2B2wCGNNF
yKb+jPeBRRM=
=TdWu
-----END PGP SIGNATURE-----
