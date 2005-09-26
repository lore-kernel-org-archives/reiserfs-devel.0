From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 100% CPU
Date: Mon, 26 Sep 2005 00:41:24 -0700
Message-ID: <4337A624.5030008@namesys.com>
References: <a112e5bc05092316441d22bff5@mail.gmail.com> <op.sxlrh9sxd4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.sxlrh9sxd4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-2?Q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>
Cc: Gherald <gherald@gmail.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>, vs <vs@thebsh.namesys.com>

=A3ukasz Mierzwa wrote:

> Dnia Sat, 24 Sep 2005 01:44:02 +0200, Gherald <gherald@gmail.com>
> napisa=B3:
>
>> A snipet from htop:
>>
>> PID  USER     PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
>> 66   root      25   0     0     0     0 R 50.0  0.0  1h21:53 pdflush
>> 3235 root      25   0     0     0     0 R 49.5  0.0 33:50.45 ent:hda6!
>>
>> uname -a :
>> Linux mu 2.6.14-rc1-mm1 #1 PREEMPT Tue Sep 20 16:02:39 CDT 2005 i686
>> Intel(R) Pentium(R) M processor 1200MHz GenuineIntel GNU/Linux
>>
>> This is my first and only reiser4 filesystem, and has not been used
>> with any other kernels.
>>
>> fsck.reiser4 didn't seem to find anything, and the problem reoccured
>> after reboot
>>
>> -Gherald (off list, CC me)
>>
>
> I had the same problem with this kernel, ent:hda5 was using all cpu time.
> 2.6.12 with latest patch for it works the best for me.
>
>
Sorry to say that latest big changes made reiser4 into a bit of a
turkey.  vs, can we warn about this somewhere?

