From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Tue, 08 Feb 2005 14:24:07 -0800
Message-ID: <42093C07.4010804@namesys.com>
References: <20050206034102.3956432d@polo.concept-micro.com> <42066D9C.8030908@slaphack.com> <20050206225539.0c2d0c10@polo.concept-micro.com> <4206FDC4.1060401@slaphack.com> <20050208094257.GX26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050208094257.GX26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Masover <ninja@slaphack.com>, Pierre Etchemaite <petchema@concept-micro.com>, reiserfs-list@namesys.com

Reiser4 CPU usage is reasonable now I think.  If you experience that it=20
is too high, use the extents only mount option, and it should be pretty=20
good.  Maybe somebody has some time to create some numbers?  I could be=20
wrong, but let us look at numbers.....

Hans

Markus T=F6rnqvist wrote:

>
> =20
>
>>Think I remember some other filesystem being really lightweight CPU.
>>UFS or something.  But XFS shouldn't be too bad.  Where does your
>>"probably" come from?
>>   =20
>>
>
>UFS as in Unix File System? Eww..
>
>Dunno about CPU usage, but I tested XFS once and it was painfully slow.
>Fortunately it got better, so maybe my test was somewhat flawed.
>
>Maybe the Namesys guys would want to release some new and up-to-date
>benchmarks now that the AMD64 panic bug is fixed?
>
> =20
>

