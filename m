From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: 2.4.22pre7aa1 ;-) Mit O(1) aber leider kein pre-emption
Date: Wed, 30 Jul 2003 07:11:48 +0200
Message-ID: <3F275394.6030200@netscape.net>
References: <200307211639.32418.Dieter.Nuetzel@hamburg.de> <3F1C090E.8020903@netscape.net> <3F1C0CDD.8070103@netscape.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060707060100020908040409"
Return-path: <reiserfs-list-return-15111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1C0CDD.8070103@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--------------060707060100020908040409
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07/21/03 17:55, Manuel Krause wrote:
> On 07/21/03 17:38, Manuel Krause wrote:
>=20
>> On 07/21/03 16:39, Dieter N=FCtzel wrote:
>>
>>> Data-logging in the works?
>>>
>>> Regards,
>>>   Dieter
>>
>> Mmmh. ATM of .22-pre7 only "old" rml-preempt for 2.4.21-final does not=20
>> apply well on vanilla .22-pre7.  But that only in=20
>> linux/arch/sh/kernel/entry.S and linux/arch/ppc/mm/tlb.c compared to=20
>> the adjusted version for -pre5. Do you really need those files for now?!
>>
>> Recent data-logging without quota does apply without errors on here=20
>> tough.
>=20
> Heaven, sorry! I definitely don't have the O(1) in here... and no aaX...
> So, this info was only for 2.4.22-pre7 plus preempt plus data-logging=20
> plus search_reada... Sorry for the inconvenience...
>=20
>> But I haven't got the compile up and running yet.
>>
>> BTW, the HZ=3D1000 setting makes my system time get some minutes=20
>> backwards  when having a longer uptime. It's solved on every bootup. I=20
>> this typical or have I missed something?!
>=20
> Bye,
>=20
>  Manuel

Yess, I missed something as I don't read LKML usually. They have too=20
much more SPAM compared to ReiserFSlist nowadays... (No kidding, but I=20
don't need LKML in its whole fashion. But great thanks to the=20
Hero-Anti-Spam-Worker of this list, Alexander Lyamin !!!, BTW, as spam=20
rate drops to ZERO.)

The attached patch was posted to LKML and is supposed to solve what I=20
asked for in the last paragraph of my previous mail that stayed=20
unanswered so far. I finally found it myself last hour.

Thanks and bye,

  Manuel



--------------060707060100020908040409
Content-Type: text/plain;
 name="patch.mkYY.timer_compensation_1000HZ.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.mkYY.timer_compensation_1000HZ.diff"

diff -Naurd old/kernel/timer.c linux/kernel/timer.c
--- old/kernel/timer.c  2003-07-18 17:27:01.000000000 -0400
+++ linux/kernel/timer.c    2003-07-18 17:32:19.000000000 -0400
@@ -606,6 +606,15 @@
     else
    time_adj += (time_adj >> 2) + (time_adj >> 5);
 #endif
+#if HZ == 1000
+    /* Compensate for (HZ==1000) != (1 << SHIFT_HZ).
+     * Add 1.5625% and 0.78125% to get 1023.4375; => only 0.05% error (p. 14)
+     */
+    if (time_adj < 0)
+   time_adj -= (-time_adj >> 6) + (-time_adj >> 7);
+    else
+   time_adj += (time_adj >> 6) + (time_adj >> 7);
+#endif
 }
 
 /* in the NTP reference this is called "hardclock()" */

--------------060707060100020908040409--
