From: David Masover <ninja@slaphack.com>
Subject: Re: The Infamous Reiser4-randomly-blocks-for-ages-and-writes-the-hd-continously-in-the-mean-while
 now with a btrace log! (hope it helps)
Date: Thu, 10 Aug 2006 14:48:59 -0400
Message-ID: <44DB7F9B.4030504@slaphack.com>
References: <20060806162017.GB8613@rvalles.homedns.org.> <5c49b0ed0608070233p68204fd1la2630e49fb08fad7@mail.gmail.com> <44DB6080.8070306@iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29568-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44DB6080.8070306@iki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vesa Kaihlavirta <vegai@iki.fi>
Cc: reiserfs-list@namesys.com

Vesa Kaihlavirta wrote:

> Incidentally, I've witnessed similar behaviour in various simple tasks,
> e.g. writing
> entries to an sqlite database, or receiving mail from pop3 in thunderbird.

Sounds like fsync issues.  That is being worked on.
