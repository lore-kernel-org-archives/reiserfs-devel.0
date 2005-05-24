From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 O_DIRECT
Date: Tue, 24 May 2005 16:35:51 -0500
Message-ID: <42939E37.8060107@slaphack.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu> <4291225B.5090503@slaphack.com>            <20050523095212.GD11013@nysv.org> <200505231653.j4NGrksq017538@turing-police.cc.vt.edu> <42921886.40404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42921886.40404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, =?UTF-8?B?TWFya3VzIO+/vQ==?= <mjt@nysv.org>, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Valdis.Kletnieks@vt.edu wrote:
> 
> 
>>On Mon, 23 May 2005 12:52:12 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:
>> 
>>
>>
>>>On Sun, May 22, 2005 at 07:22:51PM -0500, David Masover wrote:
>>>   
>>>
>>>
>>>>Of course, I've worked on sufficiently few big projects that I'm still
>>>>naive enough to believe that unit tests _can_ catch everything, if
>>>>they're done right.  I'm sure I'll eventually be proven wrong...
>>>>     
>>>>
>>>
>>>I'm sure a testing professional will happily prove you wrong ;)
>>>   
>>>
>>
>>It's *never* the testing professional that disproves "unit tests can catch everything".
>>
>>It's the guy with the creeping-horror Cobol/Python database that finds the stuff
>>that unit tests can't catch.. ;)
>>
>> 
>>
> 
> My favorite for version 3 (we now test for this in v4 testing) was
> mozilla truncating files longer rather than shorter.  Legal but was not
> tested for....

I see how that works.  I'm going to have to think a bit harder now.

My feeling is that you create the standard as you create the test, not
the other way around.  If the test works, then there are by definition
few bugs if any in the system itself -- any other bugs are actually in
the application, not the system.

Still, your true ignorance is what you don't know that you don't know.
There's always something that you didn't think to think of.  And I'm
thinking of putting that as a disclaimer on all my mail...

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpOeN3gHNmZLgCUhAQK5lBAAmaZCXIlaSaD3aVXSyH3tdiEPS9UEOdvH
eVtmvaM5ZO5ao1aebaodAmVSqmzEKbLCeNCaoa6ZTsFi6uHC21hOBTpqHxW0i94Y
PN22cw3ZTtpPU2KUWB7dTHqI9uz5JUMkMnFg7moRqH/bDzk+XBeNH9xgFnkzYjuj
g3nMvJUGggbNCX0XLsDAiQnOUe/rzvgIMP4LtcWi9UxzNKa//PfLBM/dO6ry77R7
PD404BVxXy5OHgJc8L4D2FLB6fdOTX7rUFC7GYqGhl9pdv8HGxOrQ+AkbhFF2F0/
hgXeX/7mMtFehZD19i8A/+uglR+qqw+1P8zsF8AoMmoRwhhDA25enH6knImSQh9q
Ppzht93CABh0WtHM/jHkSM9Dpla9u67FMqlsFV5eRWMLXqTK/OVcm+zGM4pKPBcL
8gXiEdpiqj/pYjMjsvIhxwyVIpEIZrpo6V0zilimHMaFuiTtZ9M8KrKMhTWx/xAp
upLAV8e17NJ8ew+I1ChHqXhDgFOxh1uzVkY2iCVsjjVEsNJbPwsb1jMg35RhC+RW
1L/7dUp7CPzd5xhE3oSoKDhGkTDKKQOhfX1CkWIgTGGmhc2nqQSmriK6wr0dxyHM
R2vaRbvlKWSH5r/JNw9vEyWKIDRuoQdEy+kdEhvBF1Y61HMGUqacdOlLoM+ozVZA
g3GPsl/jixg=
=00kz
-----END PGP SIGNATURE-----
