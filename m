From: =?iso-8859-2?Q?prymitive?= <prymitive@go2.pl>
Subject: =?iso-8859-2?Q?Re:_file_as_a_directory_?=
Date: Tue, 30 Nov 2004 06:53:06 +0100
Message-ID: <20041130055306.6CAC4D0B2F@rekin6.o2.pl>
References: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dnia Mon, 29 Nov 2004 18:20:35 -0300, Horst von Brand <vonbrand@inf.
utfsm.cl> napisa=B3:

> Now think about files with other formats, for instance the (in)
famous
> sendmail.cf, or less structured stuff like you find in /etc/init.
d/, or
> just Postgres databases (with fun stuff like permissions on=20
records and
> fields)... or just people groping in /etc/passwd wanting to find=20
the =20
> whole
> entry (not just one field), or perhaps look at the 15th character=20
of the
> entry for John Doe.
>
> This way lies utter madness (what format description should be=20
applied to
> what file this time around?). Plus shove all this garbage into the=20
=20
> kernel?!

First time I was reading about /etc/passwd and stuff it was really=20
directory as file, imagine You have a directory "/etc/passwd/" and=20
inside files like "root", "john" and so, if You acces this directory=20
by typing "cat /etc/passwd/" You would get list of files inside, but=20
when You type "cat /etc/passwd" You get contest of all files inside=20
this directory listed like one big file, the security bonus is that=20
all files in /etc/passwd/ can have diffrent permissions, that was my=20
firts impression of /etc/passwd hype and I think it would be quite=20
good, putting *.tar, *.bz2, *.xml, *.whatever parsers in kernel is=20
simply not.

=A3ukasz Mierzwa


