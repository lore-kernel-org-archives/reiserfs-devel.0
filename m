From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: v3 rebuild-tree left system in unusable state because of space shortage
Date: Fri, 15 Sep 2006 16:00:01 +0400
Message-ID: <200609151600.01978.vs@namesys.com>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com> <200609151343.39692.vs@namesys.com> <2f4958ff0609150334l2f52574el151e1dcff1f721be@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0609150334l2f52574el151e1dcff1f721be@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Grzegorz =?utf-8?q?Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Friday 15 September 2006 14:34, Grzegorz Ja=C5=9Bkiewicz wrote:
> okay, seems to makes sens.
> So you guys are working on it, or is the problem not quite fixable ?
>=20

Substantial changes are needed to fix this problem.

> The underlying problem is what worries me more - the file that was
> deleted, but space never got free.
>=20

Could it be that the file was opened when you deleted it?

> I am about to buy larger HD today (this one was 160, I am going to get
> 250 one), so I can do it in hardware. We will see, I'll report later
> how it went along.
>=20
> Ta for help.
>=20
>=20
