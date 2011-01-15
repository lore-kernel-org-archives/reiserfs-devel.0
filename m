From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: Reiser4 and mount times
Date: Sat, 15 Jan 2011 19:46:12 +0200
Message-ID: <4D31DD64.3060202@gentoo.org>
References: <4D2BE02E.6040207@gentoo.org> <4D2C3143.7050008@gmail.com> <4D2D28D1.5010306@gentoo.org> <4D2E12AD.6030508@gmail.com> <4D31376F.1080903@gentoo.org> <4D31B1BB.7000906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D31B1BB.7000906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 15-01-2011 16:39, Edward Shishkin wrote:
> On 01/15/2011 06:58 AM, Serkan Kaba wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> After switching to dont_load_bitmap I started having freezes when
>> starting pidgin (not always).
> 
> 
> Are there any visible disk activity while freezing?
I'l try to give more details if I reproduce it. Meanwhile I'm giving
disto kernel details which I should have done before.
$ uname -a
Linux firari 2.6.36-gentoo-r3 #24 SMP PREEMPT Sat Jan 8 09:08:01 EET
2011 x86_64 Intel(R) Core(TM)2 CPU 6700 @ 2.66GHz GenuineIntel GNU/Linux

I'm using the official patch against Gentoo patched kernel.

- -- 
Sincerely,
Serkan KABA
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0x3WQACgkQRh6X64ivZaJxdwCeJVulAJm9uCaKvIvQGwZJYT1i
594An0yYo5QSBpzGevYI1w28DaI7Aepa
=ar4i
-----END PGP SIGNATURE-----
