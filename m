From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: udpated data logging available
Date: Wed, 02 Jul 2003 02:46:35 +0200
Message-ID: <3F022B6B.3010801@netscape.net>
References: <1055764071.24111.650.camel@tiny.suse.com> <200306260216.41204.christian.mayrhuber@gmx.net> <1056592066.20899.10.camel@tiny.suse.com> <200306261342.08725.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306261342.08725.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/26/2003 01:42 PM, Dieter N=FCtzel wrote:
> Am Donnerstag, 26. Juni 2003 03:47 schrieb Chris Mason:
>=20
>>On Wed, 2003-06-25 at 20:16, Christian Mayrhuber wrote:
>>
>>>Am Mittwoch, 25. Juni 2003 21:15 schrieb Chris Mason:
>>>
>>>>Thanks for giving things a try.  I just uploaded io-stalls-7.diff,
>>>>which should do better at fixing latency during heavy io.
>>>>
>>>>-chris
>>>
>>>My feeling is that io-stalls-6 is where standard 2.4.21 was if it comes
>>>down to latency. But io-stalls-7 makes a big improvement for me during
>>>heavy io. The directory listing in Konqueror, including image preview,
>>>appears nearly immedeately even during heavy io.
>>
>>Great to hear, thanks for giving it a try.  io-stalls-6 helped most when
>>you've got multiple devices and a streaming write to one was slowing
>>down all the others.  -7 added in a tweaked form of Andrea's elevator
>>latency fixes, and they make a big difference when there's a lot of
>>writes to the drive you're trying to read from.
>=20
> So, does it apply to 2.4.21-aa1 (latest is 2.4.21rc8aa1) cleanly? ;-)
>=20
> Setting HZ=3D1000 (from 100) in linux/include/asm/param.h give me very=20
> impressive latency boost. 2.4.21-rc1-jam1 (-rc1aa1)

Just tried this HZ=3D1000 setting, too.

(With the following patches "only": data-logging, search_reada-4 and
rml-preempt on 2.4.21-final, and AA.00_nanosleep-6.diff (THAT ONE
decreased my VMware+system CPU idle usage in these circumstances by
approx. 1/2 [from 25% to approx. 12.5%] ).

I don't get any performance boost with it -- but some finer distribution
of "requests"  like from disk i/o, screen interaction
(XF86-4.3.0-SuSE-8.0) and running applications' progress together with
high mem/disk load (the result is my word for "finer granularity" in
computer usage). That setting feels much better than normal (HZ=3D100).

Would I face problems, though?! Why isn't that setting standard ?

> Would you have some latencytest0.42-png numbers?
>=20
> But ACPI will not shut down my SMP system (same with HZ=3D100) most of the=
 time.=20
> I had it accidentally set to HZ=3D1024 and it power down all the time...;-=
)
>=20
>>Hopefully we'll be able to hash out something suitable for 2.4.22-pre.
>=20
> 2.4.22-pre1 is out form some days...
>=20
> Regards,
>   Dieter

Thanks,

 Manuel

--
@ list.ReiserFS: I need to change my mail address from:
 manuel.krause @AT *.tu-ilmenau.de
to:
 manuelkrause @AT netscape.net
-
 Change @AT and the spaces to get contact.

