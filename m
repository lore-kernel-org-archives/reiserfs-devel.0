From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Agressive selective pre-allocation
Date: Sat, 14 Dec 2002 03:09:32 +0100
Message-ID: <20021214030932.I2727@vestdata.no>
References: <20021210074600.J26400@vestdata.no> <3DF61996.8050001@NightStorm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF61996.8050001@NightStorm.com>; from bam@NightStorm.com on Tue, Dec 10, 2002 at 11:43:02AM -0500
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Bruce A. Mallett" <bam@NightStorm.com>
Cc: reiserfs-list@namesys.com

On Tue, Dec 10, 2002 at 11:43:02AM -0500, Bruce A. Mallett wrote:
> But the problem really is that apps don't actually "grow"these files but =

> instead rebuilds them.  Thus the file system sees a request to open a=20
> new file and not to extend an existing one.  This would make tracking=20
> the above parameters way beyond difficult.

That's definitively not true for logfiles. Neither do I think it's true
for mail deliviery. It may very well be true for some mail-clients when
the user deletes old emails, but if that is the case then the whole file
will be written at once and the original problem does not exist.



--=20
Ragnar Kj=F8rstad
