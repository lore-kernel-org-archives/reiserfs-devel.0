From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Fwd: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 18:51:08 +0200
Message-ID: <op.vad3riw7hogzsi@g17b>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>
 <4BB1D144.4070506@gmail.com>
 <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>
 <4BB22BD0.6000406@gmail.com> <op.vad3n9sfhogzsi@g17b>
Reply-To: reiserfs-devel@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.vad3n9sfhogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Dne Tue, 30 Mar 2010 18:50:24 +0200 Edward Shishkin
<edward.shishkin@gmail.com> napsal(a):

> So what's up with your emerge? Why did it fail? With what error?
> Was is a system crash, power loss, etc?
>

Actually, I've had similar problem half a year ago or so.
Emerge kept dying on gcc because of an unremovable file
in the clean phase.
I solved it by switching all my partitions to tea hashing,
so it is probably related to hash collisions with the default r5.

But it may as well be an unrelated problem.


--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
