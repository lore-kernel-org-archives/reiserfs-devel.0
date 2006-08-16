From: "Tom Reinhart" <rhino_tom@hotmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 19:34:47 -0700
Message-ID: <BAY19-F100664FF73F5E9174FEC39944C0@phx.gbl>
References: <44E24899.8080201@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E24899.8080201@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: reiser@namesys.com, edward@namesys.com
Cc: reiserfs-list@namesys.com


>>Anyone with serious need for data integrity already uses RAID, so why
>>add brand new complexity for a solved problem?
>>
>>RAID is great at recovering data, but not detecting errors.  File
>>system can detect errors with checksum.  What is missing is an API
>>between layers for filesystem to say "this sector is bad, go rebuild it."

>I agree that such an API is needed.  I think there are a lot of systems
>on desktops that lack RAID though.  Probably I should leave ECC for some
>"hopefully next year" future release though.

Of course, not everyone uses RAID.  ECC would benefit some people in some=20
cases... no argument there.

But as a business man, you know about targetting the right features to the =

right customers:

Customer 1 uses RAID.  Obviously, reliability is very important to customer=
=20
1, he is willing to take the extra expense to get it.  Adding another level=
=20
of protection (checksumming/RAID restore) is a no brainer, especially since=
=20
it adds very little overhead over what he already sacrificed to RAID.

Customer 2 doesn't use RAID.  You can add all the fancy features to the=20
filesystem you want, this customer is already vulnerable to total disk loss=
.=20
  If he really cared about integrity, he would be customer 1.  If he won't =

pay for RAID, why would he pay for ECC?  (in money or disk space overhead).

Having ECC without RAID recovery is simply targetting the wrong person.

(having both wouldn't suck.  The more layers of protection, the better,=20
although ECC would only be necessary against RAID failures, which just adds=
=20
more .9's to the reliability score.  But, you can also do this by adding=20
more redundanncy disks to the array, so it's questionable if having both is=
=20
even worth the development expense)

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar =96 get it now!=20
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/

