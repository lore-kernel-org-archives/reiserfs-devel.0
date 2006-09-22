From: David Masover <ninja@slaphack.com>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 12:20:51 -0500
Message-ID: <45141B73.2000404@slaphack.com>
References: <4513827A.50809@slaphack.com> <4513AC55.1080400@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4513AC55.1080400@muenning.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Konstantin M=FCnning wrote:
> David Masover wrote:
>=20
> (snip)
>> It shouldn't be touching the disk AT ALL when there's over a gig of FREE
>> RAM (as in, neither buffer nor cache nor actually used yet), and the
>> file I'm attempting to download is less than 200 megs.  I tried an
>> strace, but as I am not at all skilled in the ways of debugging or
>> reverse engineering, I got syscall spam -- a 200 meg log file, and when
>> I finally found a decent way to analyze it, I found most of Azureus'
>> system call wall time is spent in futex().  Huh?
>>
>> Looked up "futex" on Wikipedia, and I still have no clue how this makes
>> any sense.  Either futex was somehow thrashing the disk, or Azureus has
>> somehow managed to fork completely out of strace's control.  Or maybe
>> it's somehow something that the kernel is doing on its own, which is
>> somehow forcing azureus to block, but somehow not tripping strace's
>> timers while doing so.
>=20
> Have you used -f or -ff with strace?

I used -f.  What's the difference between that and -ff?
