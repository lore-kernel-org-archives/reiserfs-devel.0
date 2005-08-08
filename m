From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: Strange problems/bugs with reiserfs and reiserfschk
Date: Mon, 08 Aug 2005 13:51:52 +0200
Message-ID: <42F74758.4060301@muenning.com>
References: <42F684EE.7010201@muenning.com> <b14e81f0050807152830555213@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050807152830555213@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi.

This processor produces much heat but this is only a question of how you
cool it. The system has no troubles with heat and stability. It's a
server which is constantly running and except the mentioned problem
there are no other troubles. I can compile things for hours on that
system so memory and/or heat shouldn't be the problem. When doing disk
access the cpu is mostly idle. Working with lots of files on several
drives had not produced any problems. There are no recent hardware or
software upgrades which coincide with the "bug". The only thing which
coincide is the FS corruption. The other drives are still fine.

michael chang wrote:
> On 8/7/05, Konstantin M=FCnning <konstantin@muenning.com> wrote:
>=20
>>There seems to be something I would call a bud in ReiserFS at least in
>>kernel 2.6.11.11 which can cause the system/computer to freeze. It is
>>caused by a corruption of the FS but at that point I expected to have
>=20
>>Kernel 2.6.11.11, Gentoo-Linux, SMP (HyperThreading P4, 3GHz)
>=20
> <snip>
>=20
> If memory serves me right, any 3GHz processor will get very hot, very
> fast.  Is it possible that it got hot and started messing up data?=20
> Maybe consider downclocking your cpu or using CPUFreq (or similar) and
> see if there isn't data loss running at e.g. 2.5 or 1.5 GHz.  Either
> that, or don't run it for more than a few hours at a time.  I'm pretty
> sure 2.6.11.11 has CPUFreq in it somewheres.  Something to look at in
> the future.
>=20
> Of course, this is all speculation.  I have absolutely no idea.
