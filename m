From: Mathieu Segaud <Mathieu.Segaud@crans.org>
Subject: Re: md raid 1 & reiser4
Date: Thu, 20 Jan 2005 08:50:31 +0100
Message-ID: <87pt00bku0.fsf@barad-dur.crans.org>
References: <Pine.LNX.4.58.0501200822270.17233@datsun.noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0501200822270.17233@datsun.noviforum.si> (Gorazd
	Golob's message of "Thu, 20 Jan 2005 08:31:41 +0100 (CET)")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

Gorazd Golob <gorazdg@noviforum.si> disait derni=C3=A8rement que :

> Hi!
>
> I have a very strange problem. I'm using 2.6.10 vanilla kernel with latest
> reiser4 patch. I'm using reiser4progs from gentoo distrobution 1.0.3.
> I have created md raid 1 device and formated if with reiser4
> (mkfs.reiser4), mounted the partition (it took a bit longer than mounting
> a normal partition), copy some data on it - and suddenly it froze. I
> wasn't able to do ls on mount point (also freeze) and so on. I wasn't even
> able to reboot system properly - waiting for unmount of reiser4 partition?
> So after rebooting the computer (hard way) I mounted same reiser4
> partition again - and it was without data. What can be wrong - is that
> known issue using reiser4 and md together?
> Reiser4 is working ok on same configuration on ide disk device (hdx).
>

which kernel do you run ?
one of the last -mm kernels has serious issues concerning raid, not
Reiser4 specific. Can you try to reproduce the problem with another
filesystem type ?

Regards,

--=20
Todays reading is from RFC990 in the book of Reynolds & Postel, page number=
 6

And the IETF spake thusly

[...]

	- Alan Cox on linux-kernel

