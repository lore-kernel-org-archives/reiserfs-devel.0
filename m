From: David Masover <jedi@ninja.dynup.net>
Subject: Re: The x Bit Problem
Date: Fri, 05 Dec 2003 08:03:15 -0600
Message-ID: <3FD09023.5070902@ninja.dynup.net>
References: <16333.14692.61778.304155@pc7.dolda2000.com>	 <3FCD47C4.50500@ninja.dynup.net> <3FCE39B8.20307@namesys.com>	 <16334.15412.686909.927196@laputa.namesys.com> <1070580817.8344.140.camel@arabia.home.lan> <3FD00086.90607@ninja.dynup.net> <3FD01679.3040007@mrs.umn.edu> <3FD07DB5.6090708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD07DB5.6090708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:

> Grant Miner wrote:
>
>> An interesting thing I discovered is that Windows simply ignores the 
>> 'x' bit (I should say the Windows equivalent of the 'x' bit, called 
>> "traverse folder / execute file"), but there is a policy setting that 
>> overrides this attribute.
>>
>> I know users get tripped up on this a lot in Unix, like when they 
>> don't understand why the webserver can't read their public_html 
>> directory.  It might be a good option for Linux.
>>
>>
>>
> The right solution is to have a separate readdir permission, so that a 
> file-directory can be not executable but be listable, and vice-versa.  
> The problem comes from overloading the bit and also changing whether 
> objects can be simultaneously files and directories.
>
Why does that need to be separate from the read bit?  In fact, right 
now, I can actually get a directory listing, but I can't even find out a 
single attribute about the files inside if the execute bit is not set.  
When is this desireable?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9CQIwisZLIF6uqOAQLdPw/9HEHbi41hey1LoH8d2wuQRDTUwH5iEZVN
ld/pnuPlHPp1sO8ag+WjoT4sv3umlSBPdRtzk3H1Y8WSBZ4xgnD6imo9eAQXzMmu
UG4t9reWrCeKgl95KCJmapH6PPYFE6O8+YliBO4uCEFHLX6UM0Xb02nkZ2dQ25+G
E1ryv5KUI+lMSliTuOEzfmMzuXapRul59Cc6WPplDmXN9ApMEnxJKYQtCBeYX1kf
Wr4/6eGnJ91kIIfMGqe30IgOBbHRAENIq+K/ha+aUjmCQOwFjEaU1Imd3ytFZbPn
xxwzXoD9+C2kNh6l3LFKiAm43rssTBwohSZbp8DNbhvboGOCgNuzzE6YzyJFNcCl
hmW4PBoKP+SG6lrGb0C3USyjY/7U8KY1OHAviNyZW2InfFpbsfNhQg/FIH2eFOHS
uhnVborliZwUA1XGxDZPG2pvrm3e0dTHyCLu2FENU7ErY/3o5IBoTS2RypWMkjiK
PBLvedufBMO4Ssq8vZg+t74pLaESsMvw4J6ebr8YwakJQS2A/a6mDTOLIe11qZby
suH35Cu3RW6ecxJ6WQnmDQcozcbKdybwbf3KWjn+MppMtzPpF+MwllykMKCHYf4t
5bVM8Mc1y1zBB+zYmF0Kv0rP9CtOvOmri2O6tDXtUOI/qDNDqKB5u5ICn/q5WVmF
Y7QciJdsWvA=
=jZ2A
-----END PGP SIGNATURE-----

