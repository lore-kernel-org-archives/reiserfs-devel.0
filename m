From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Filesystem errors
Date: Wed, 17 Jul 2002 08:40:42 -0400
Message-ID: <200207170840.42655.kuba@mareimbrium.org>
References: <200207160146.01440.cabernet@internode.on.net> <200207170811.44229.kuba@mareimbrium.org> <20020717161632.A2614@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020717161632.A2614@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On =B6roda 17 lipiec 2002 08:16 am, Oleg Drokin wrote:
> Hello!
>
> On Wed, Jul 17, 2002 at 08:11:44AM -0400, Kuba Ober wrote:
> > Did I mention that spinrite was about 100kb in size and written in
> > assembler?
>
> This is not an advantage by any means in my view. It only means it is
> x86 specific, most probably requires dos/windows, and hard to debug.

You're right, but the guy simply kept it in assembler since mid-80's.

And as far as I know him, and I know his coding style a little bit from=20
disassembling the early spinrite II, his code is mostly more legible than=20
poorly written C++.

And the program, believe it or not, does not require debugging as it is. I =

think that the current version works fine w/o any changes nor patches since=
=20
about 3 years or so. He does one hell of a testing job, and he always bases=
=20
on previous code that worked (most probably one of the reasons why it's sti=
ll=20
in assembler).

He is kind of assembly-maniac, but he has some windows utilities which are =
in=20
assembler and do very cool things.

Cheers, Kuba Ober
