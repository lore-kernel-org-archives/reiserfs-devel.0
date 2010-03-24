From: Vidra.Jonas@seznam.cz
Subject: =?us-ascii?Q?Re=3A=20Segfault=20in=20fsck=2Ereiser4?=
Date: Wed, 24 Mar 2010 09:54:51 +0100 (CET)
Message-ID: <7880.2170.3389-28898-1298266740-1269420891@seznam.cz>
References: <4BA94154.7010106@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BA94154.7010106@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com

Dne Tue, 23 Mar 2010 23:31:48 +0100 Edward Shishkin <edward.shishkin@gm=
ail.com> napsal(a):

> Segfault is caused by aux_adler32: offset (4294839597) is out of boun=
ds..
> Could you print and show us the structure "hint"?

(gdb) print hint
No symbol "hint" in current context.

Am I doing it right or should I set a breakpoint somewhere before the c=
rash?


--=20
Jon=E1=B9 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
