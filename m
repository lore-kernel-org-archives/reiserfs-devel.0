From: Hans Reiser <reiser@namesys.com>
Subject: Re: Linux v2.5.42
Date: Sun, 13 Oct 2002 02:19:41 +0400
Message-ID: <3DA89FFD.6010803@namesys.com>
References: <200210122220.29381.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Dieter N=FCtzel wrote:

>>>>Should EVMS be included, the team will make it our top priority to
>>>>resolve the disputed design issues. If the ruling should be that some of
>>>>our design decisions must change, so be it, we will comply. Certainly
>>>>some changes can not be done by the 20th or 31st, however I feel
>>>>the team can handle most changes before 2.6 ships.
>>>>       =20
>>>>
>>>Thats good to hear. Right now the debate appears to be - "users: please
>>>add EVMS" "hackers: oh my god no" - so you got the feature set right it
>>>seems
>>>     =20
>>>
>>Obvious point:
>>
>>* Linus can always thaw the tree after 31st just for one addition, if
>>something _really_ needs to be added for 2.6
>>   =20
>>
>
>Beside EVMS there is another one: Reiser4
>Getting such an FS "for free" is worth it.
>http://www.namesys.com/v4/v4.html
>
>Hans, can you please send a summary of the "new" FS limits?
>PB/EB, etc.? ;-)
>
>Regards,
>	Dieter
>
> =20
>
The new size limits are those of the Linux VFS layer (we use 64 bit=20
numbers most places so that if we port to another architecture, or ia64=20
becomes viable....).   I don't think anyone will find them motivating. =20

Dramatic performance gains while offering transactional FS operations=20
(wandering logs work, woohoo!), plugins, scalability due to per node=20
locking, obsoleting a whole slew of traditional database tree algorithms=20
for better performance, those are motivating.  Wait for Linux Journal to=20
come out, it will have the benchmarks, and you'll see what I mean by=20
dramatic.   It will be good enough that we can focus mostly on getting=20
the semantics in place for the competition with OFS.

Hans


