From: F Peeters <Francesco@FamPeeters.com>
Subject: Return receipt (was Re: Failed ReiserFS)
Date: Thu, 10 Feb 2005 08:19:04 +0100
Message-ID: <420B0AE8.7090805@FamPeeters.com>
References: <200502100535.01814.rikjoh@norweb.se> <1108016768.395.257.camel@tribesman.namesys.com> <200502100756.48506.rikjoh@norweb.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502100756.48506.rikjoh@norweb.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Rikard Johnels <rikjoh@norweb.se>

Rikard Johnels wrote:

>On Thursday 10 February 2005 07.26, Vladimir Saveliev wrote:
> =20
>
>>Hello
>>
>>On Thu, 2005-02-10 at 07:35, Rikard Johnels wrote:
>>   =20
>>
>>>Hello all.
>>>I am new to the list so please have patience with me for maybe asking
>>>obvious questions.
>>>
>>>I tried a recovery as described in the manpages;
>>>
>>>talen:~ # reiserfsck --rebuild-tree -S /dev/hdc1
>>>--logfile /root/reisercheck.logfile
>>>     =20
>>>
>>Why did you use -S?
>>
>>   =20
>>
>>>It ran as excpected (i hope) right up until the end where it barfed wi=
th;
>>>
>>>Pass 3a (looking for lost dir/files):
>>>Looking for lost directories:
>>>Looking for lost files:
>>>lost+found.c 348 pass_3a_look_for_lost
>>>look_for_lost: The entry 'lost+found' could not be found in the root
>>>directory.
>>>Aborted
>>>
>>>What is wrong?
>>>     =20
>>>
>>You have hit reiserfsck bug.
>>
>>   =20
>>
>>>What can i do?
>>>     =20
>>>
>>Which reiserfsck do you have?
>>   =20
>>
>
>reiserfsck 3.6.13
>I used -S to scan the whole partition, as per man page
>A bug heh.. :(
>So is there any fix for it?
>
>
> =20
>
Rikard,

Can you please turn of return receipts for this list? I'd appreciate not =

having to press NO every time I read one of your messages...

Tack s=E5 mycket!

Francesco Peeters
http://www.fampeeters.com
----
GPG Key =3D AA69 E7C6 1D8A F148 160C  D5C4 9943 6E38 D5E3 7704
If your program doesn't recognize my signature, please visit=20
http://www.CAcert.org/index.php?id=3D3 to retrieve the Root CA certificat=
e.

