From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: Raid5, LVM and Reiserfs
Date: Sun, 20 Oct 2002 14:33:01 +0200
Sender: lars@marowsky-bree.de
Message-ID: <20021020123300.GB6690@marowsky-bree.de>
References: <3DB0239C.2050409@namesys.com> <000701c277c9$ef8d6c70$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <000701c277c9$ef8d6c70$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: darren <teodarren@myrealbox.com>, reiserfs-list@namesys.com

On 2002-10-20T07:47:50,
   darren <teodarren@myrealbox.com> said:

> I need on RedHat 7.3 with 2.4.19:
>=20
> 1)	Software RAID5 (any recommended settings?)

Just as recommended per man 5 raidtab -> parity-algorithm left-symmetric,
chunk-size might need some experimentation, but I recall 32k is usually OK.

> 2)	Reiserfs (how do I make reiser over raid?)

The software raid device will show up as /dev/md0 (or similar); use that
blockdevice for creating the filesystem on.

> 3) 	I was told I need LVM too??

This is certainly a good idea. LVM will allow you to create many logical
volumes on a single software raid device; otherwise every block device you
want (ie, a separate filesystem) will require its own software raid device,
which will be a pain. Especially if you ever need to change sizes of the
devices or add/delete some, LVM will be a god-send.

> Any advise abt how I should go about this?

Carefully, as always ;-)

I suggest you read the software RAID howto. I am surprised that RHAT doesn't
offer selecting software raid right in the installer?


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
Principal Squirrel=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
