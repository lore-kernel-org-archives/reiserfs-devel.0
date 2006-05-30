From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Tue, 30 May 2006 22:08:34 +0400
Message-ID: <b5d90b2a0605301108n7583853bh18d8ddaf61c181bc@mail.gmail.com>
References: <1148923857.6482.12.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1148923857.6482.12.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev <reiserfs-dev@namesys.com>

On 5/29/06, Vladimir V. Saveliev <vs@namesys.com> wrote:

> Please try it. Any feedback is welcome.

Applied it to 2.6.16.18. It behaved very well comparing to 2.6.15.6 w/
second .15 patch.
It's a pretty busy web server, I usually open `tail -fs.1 access.log`
in one ssh window, and `vmstat 1` in another. 2.6.16.18 still shows
small pauses during write-outs, though they are much shorter - 1-2
seconds, comparing to up to 10 seconds on 2.6.15.6, and it writes out
in ~20Mb/second chunks (and ~5Mb/second on 2.6.15.6).
So the performance part is great. But it crashes after few hours of
work. Logs are empty (tried it couple of times, first time it crashed
20 minutes after booting system, second time it survived for about 5
hours). No error messages in logs (logs are on r4 partition too, I'll
try to place logs on ext2 partition if I'm unable to reproduce this
crash on my home PC).

-- 
Alexey Polyakov
