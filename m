From: David Masover <jedi@ninja.dynup.net>
Subject: Re: [Swsusp-devel] What issues are still outstanding?
Date: Tue, 16 Dec 2003 19:08:18 -0600
Message-ID: <3FDFAC82.5090103@ninja.dynup.net>
References: <1071549944.28868.9.camel@laptop-linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1071549944.28868.9.camel@laptop-linux>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: swsusp-devel <swsusp-devel@lists.sourceforge.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nigel Cunningham wrote:

>Hi all.
>
>Here's another attempt at gathering into one place all the outstanding
>issues I still need to address before 2.0...
>
>- ACPI events during suspend (show stopper?)
>- SMP support (OSDL project approved)
>- Suspend script pending changes (Bernard)
>- Michael's NFS freezer failure
>- Michael's occasional first-time oops
>- Dan's suggestions for Documentation changes
>- Slow image writing (as seen on some computers, including my desktop)
>
>Others? Please keep the above list and add to it.
>  
>

Reiser4 support?  I can't be the middleman here -- I know almost nothing 
about it except that the latest reiser4 and swsusp snapshots do not like 
each other.

>Regards,
>
>Nigel
>  
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9+shgisZLIF6uqOAQJh0g/+Pukoko1Sjc1XC6wIEM7TLQudJDnRoeOs
NWE0H+8sKyNYNoQ6CNg3ZFmVsH1kx7Bhy5KauWh3KnwxndWJqpb8TPysZ4TOT6Vr
P5qp2s6YCiaiZ6yxcrqrI8ZBY51MvTpWieP0eu2+ij+pl0xW+NakZSKNBs50QoT2
WmWn+CtYVWnzjzJm18ybiUh/xR5rBSJTWRdLD2M85rzsyyO0AoFiMrtsDA/PAIPl
OVPm5kxkk4PJw7pE8xy/Fcss9y1r95jA5DbrX+zrVYrYUVGWR8oC9/dEw2d1E+qk
eTDP7Ne6uka1GGXPtOlTEsJ5cBzARpOxrO+4JVukZih2eTyNnIVe7rWWUaGj/lgk
NuU+41/xkRRcbRInlyW7KEzxYLvCjmjBQjNnA5mA+j+sYttIDKZPqsmr3A1DPugm
0vEHaKOFwsm7K4GRCJxP/kXDPnFoTbiYv2aDa3Xx10/viA+h3u2+fPgv1heiR0Dv
0Vqkf+wC7eb+8Mg7FjrUBVL7CxiDFOrEP57wSChMZw7NShy8rRgx66whQvpNRsd+
tJhauBsM6r9/1/1L6dWwdsMEdweoPq9PBllRSUpr6XA8LpcQwtgD0UjCKup0CDw0
ktfsGWBNDamAXKKE9xW/H+g8ThjQL7qj0JKhKF5A2K1SZzmsfWqbiSpMIXHWMw2L
d+JA3d+4UHY=
=996J
-----END PGP SIGNATURE-----
