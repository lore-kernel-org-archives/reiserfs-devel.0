From: David Masover <ninja@slaphack.com>
Subject: Re: one idea about reiser4 compress
Date: Sun, 10 Apr 2005 12:25:27 -0500
Message-ID: <42596187.5000205@slaphack.com>
References: <42553064.9060604@namesys.com> <200504101338.AA00075@bbb-jz5c7z9hn9y.digitalinfra.co.jp> <425940FC.8060401@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425940FC.8060401@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linuxhippy <linuxhippy@web.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linuxhippy wrote:
> Hi Jun!
> 
>> Assume you install a distribution on a compressed partition with reiser4.
>> you usually do like this --
>>
>> | CD | Installer with decompression | -> | Re-compress with Reiser4 |
>> HDD |
>>
>> You dont think decompression -> recompression cycle is wasteful?
>> If CD contains compressed files with reiser4 compression format,
>> I guess it is possible to do like this --
>>
>> | CD with reiser4 compressed files | Installer | -> | HDD |
>> I mean, this eliminates an overhead of re-compression and make whole
>> isntall process simpler and faster. Maybe you could do install like
>> this --
>> # cp -a /mnt/cdrom /mnt/target_hdd
>> And this way would be much faster than usual installer today.
>>
>> How about this idea?
>>  
>>
> 
> To be honest I do not think your idea can be realized in a useful way
> because of:
> a.) Every Installer uses its own compression format, most time those
> packages have additional fines in it like install scripts and so on.

So support zisofs, if we're talking about a CD.

> b.) Reiser4.1 compression will eb definitivly optimized for speed,
> installer-packages are usually heavily optimized for size.

Right.  Hopefully, we'd have different algorithms supported, and zisofs
compression is gzip, which might be useful.  If it's not, then this
becomes a transcoding problem (convert gzip-to-zlib with no
decompression/recompression) which is beyond the scope of Reiser.

> c.) You would need new API's to archive this. Either through syscalls or
> via reiser's special files.

Special files are supposed to be easier than that.  Assuming that we
have a decent standard to allow custom extensions, the API should be no
big deal.  Look at XML's namespaces for a good exaple of such a standard.

> Conclusion: It would be a major hassle to implement such stuff for next
> to null advantages. There are so many (important) features waiting to be
> implemented ;-)

I agree there, but I won't be the one implementing it, and chances are
you won't either.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQllhh3gHNmZLgCUhAQJjRQ/+JWxU8ozwZqxZu1kC2r5L58Ij8ivm2ZDu
2+SRIh3qF8wtk049gx+a5YUWP66wD3FGhzeGwxzhoJ3exGTsP/HRASYWM7TB0/t0
+e96RaC4kn36mjWPEU2M0KFblZG3UUNjHL9Tpvsta3crOyhz4vc9ODpFPKzfqVqE
kKz1SGtA//noXbpdldmD4U30AoXApMH8396T4f62g3xTrdNvTfX9a/HuqTzGRXnm
whObzSmNPIvhRvaU/fYLQHFvKh6zat5rRXbt1AEy3264SzU9X0JnfeIjjF5KTMN0
mzjUt26E4sTKKLgAsMaJun35wsmq2dXsj16LHx+CujI6dcXC2pHK0HP5GpcSxJ5g
CVmsiMSd3GzDi5YbRjHoeLNwHA8nZThljTL3PbRrUsROHGsQe2k68G2RN8555g0S
apc3X45NMxmJtkZuIWv4GCzq4lpbj+DCLiSioIfhLoY+uxRELu9yLCRcgebuOcmo
dUcBnZS4uXSU0lYp6K0C+XvqFgi9Q/Q0YrseqbHNzABFzA/NHf7I/yDqg9yXQvxK
hcQ7y0lpeXO6rL2YEWCTCU5625M9HoZVnN1glzBSVpoqvscnxsrA/+1oxfDvLnAb
DSFfD9cvSmOtg83K/Li4Sirt8Bn7mjTaMi3vC/V2tuKrQ24QtRTBvhtbTtpITgkr
WPqgsq1/fHo=
=KIBS
-----END PGP SIGNATURE-----
