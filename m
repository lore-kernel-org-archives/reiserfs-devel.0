From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 status: we can't hit bugs anymore, we will do one final round of benchmarking and send it in to Andrew
Date: Wed, 23 Jun 2004 00:00:21 +0300
Message-ID: <20040622210021.GQ4990@nysv.org>
References: <40D88BF9.5090605@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40D88BF9.5090605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

What does the topic mean, it's just natural to hit bugs, and more likely
when it's accepted. That's the beauty of having even more testers around :)

On Tue, Jun 22, 2004 at 12:43:53PM -0700, Hans Reiser wrote:
>I told the guys we needed to do one last thorough set of benchmarks 
>before we send it in, to make absolutely sure that performance has not 
>been lost anywhere after all the bugfixes and radix tree porting work.

How does it look?

I decided against fsck --fix, to mkfs with ext-3-fibration and see how
fast I could copy and move stuff from one Reiser4 drive to another; it averaged
probably around 50 megabytes per second for my old Athlon 1.3GHz
which is about as fast as it can get, I guess. Good enough for me :)

>Our new webserver using reiser4 is being put into operation today.

Congratulations!

Thanks for the great work!

-- 
mjt

