From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: Hard errors, trying to recover
Date: Wed, 30 Jun 2004 17:16:46 +0200
Message-ID: <40E2D95E.2020908@gmx.net>
References: <20040629193943.GA15481@p15104972.pureserver.info> <200406301802.05840.vitaly@namesys.com> <200406301645.13096.kris@xn--khntopp-90a.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406301645.13096.kris@xn--khntopp-90a.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?B?S3Jpc3RpYW4gS8O2aG50b3Bw?= <kris@xn--khntopp-90a.de>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Kristian K=C3=B6hntopp wrote:
>=20
> 2. When I make an image of a disk, and that image is incomplete=20
> for whatever reason, I cannot reiserfsck that image because of=20
> seeks beyond the end of the medium. Again, I'd rather have the=20
> choice of reiserfsck trying to salvage the incomplete medium=20
> (assuming all zero data for all missing blocks) or stop with an=20
> error.

That's why you should NOT use dd. dd is crap for data recovery. Use
dd_rescue instead. It will give you the options of writing zeroes instead
of aborting the copy, reading the disk backwards etc. And reiserfsck
should work perfectly with an image made by dd_rescue.

Carl-Daniel
--=20
http://www.hailfinger.org/
