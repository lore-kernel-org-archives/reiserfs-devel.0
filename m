From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 19:22:51 -0500
Message-ID: <4291225B.5090503@slaphack.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com>            <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505222247.j4MMlr85008867@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
> On Sat, 21 May 2005 23:49:00 +0200, Pysiak Satriani said:
> 
> 
>>I remember Hans saying that r4 is so stable that the developers themselves
>>can not find any more bugs.
> 
> 
> Which in reality probably means "It *probably* won't eat your data".
> 
> Remember that the developers have a limited number of different hardware
> configurations, and a limited number of test tools, and a limited number
> of ways they use the file system.
> 
> So there's probably *plenty* of bugs still to be found - most of them the sort
> that nobody will expect, and won't be found until some user's creeping-horror
> database application that's written half in Cobol and half in Python does something
> totally stupid but legal.....

This is exactly why it should be in the kernel once the developers can't
find any more bugs.  Marked as experimental, mainly, but in the kernel
where real users can throw cobol/Java/sql bastardizations at it and
break it.

Of course, I've worked on sufficiently few big projects that I'm still
naive enough to believe that unit tests _can_ catch everything, if
they're done right.  I'm sure I'll eventually be proven wrong...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpEiWngHNmZLgCUhAQKsfhAAmIMqe5C76D4TkbEHON261LgFS5wpqe+W
zhe2NlIk8BesA3YhYDFt/4zwQuVMZKkyFH5Np5N1dzfnP0ztpunfovKNApuYz7NH
qxIfbH0QCRHcXX7RrrChLZcpyXy1+hbIa71KmpoaciE30SEOxR3M8DlCO6uIhlGq
kjIJmO0YzIKECSmlHTbZEr0ox23C+fc1kGnH+KWq5qr2kyR0PIhUaqAn8lKMBDE6
vITNk/AodtFZgkJJytEcGU30ZAx4mLH2L/VH1oOM08huEuJjxB8stBlXU09Z/j4o
lowI4gK/N6vRqwHGQ2U0DZSyFqt9nKM72gzfN4gz8yZJgI8BUANLjHEEbnmCnwMJ
nNeoMlyanZPhnk5/C1ISnjL6z+bqWa/SduZExeauXbDYwemJpZzyqOShccsGONbO
Y2dPO3oW/CM0nPjoFTM6TtAGwybA6BsO7WFdyGwq75bCqnN5o2W1oc1o9K5ZiPJ/
obzxmPSMpOcrY/vo7knzBd37oQHBZUFI8lxwaMO+GgZaBzSOVDVaCEtQzBc98MPP
JHNJXmeOWUI0KYVDyd5ACjlhjjvpp0NEGgbMEqNgZy6oNmP734YSUeIVBONpPg2g
/ra+qyL/zji21r93bNUhuIvoX1EUl0/FvFk+0q1S3P5DaCBpn8vz8jqO1Rr3ZvWb
Qd3c53MrHZE=
=b8kU
-----END PGP SIGNATURE-----
