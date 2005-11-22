From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 11:23:51 +0100
Message-ID: <200511221123.51724.marcel@hilzinger.hu>
References: <200511171447.41362.mail@earthworm.de>
Reply-To: marcel@hilzinger.hu
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511171447.41362.mail@earthworm.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

Am Donnerstag, 17. November 2005 14:47 schrieb Hesse, Christian:
> Vladimir V. Saveliev wrote:
> > Please try whether the attached patch improves anything. It simplifies
> > fsync by avoid commiting of transactions which do not modify file being
> > fsync-ed.

Did you ever think about, that this is not a reiser4 problem, but a kernel =
bug=20
or a problem related to hal?=20

Suse 10 has big problems with external USB drives using sync as mount optio=
n.=20
They used sync already in 9.3 but with 2.6.11 there were no such problems.=
=20
There has been some changes in kernel 2.6.13 and 2.6.14 concering the sync=
=20
behavior, perhaps it can help investigating there first, bevor fixing reise=
r4=20
for nothing...

=2D-=20
=C3=9Cdv=C3=B6zlettel -- Mit freundlichen Gr=C3=BCssen,
Marcel Hilzinger
