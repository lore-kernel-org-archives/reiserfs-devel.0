From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 03 Sep 2005 21:38:59 -0500
Message-ID: <431A5E43.4060005@slaphack.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu> <b14e81f005090318046ee67d7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f005090318046ee67d7e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: thenewme91@gmail.com
Cc: Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

michael chang wrote:
> On 9/2/05, Matt Stegman <matts@ksu.edu> wrote:

> That said, I'd be half-satisfied if a repacker is released months or
> years earlier because it doesn't efficiently handle weird cases (so
> long as it remembers to try and repack free space too).  As for the 5%
> error; a warning is safer.  Either that, or put in a force option to
> get around the "error".

A mount option specifying the amount of space to reserve?

You probably don't want to disable the limit altogether.  Some people
might go the other way, forcing at least 15-25% of the disk to be free
for performance reasons.  I think the mount option is safest, and
certainly safer than trying to do this per-process.

