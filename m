From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: fsck 0.5.5 time
Date: Fri, 18 Jun 2004 14:01:12 +0300
Message-ID: <20040618110112.GG4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

How long is the expected time for fsck to run?
I did --fix on my root partition, which is around 32 gigabytes and it
took nearly an hour, maybe. The fact that I cancelled --build-sb to run
--fix sort of messed up my measurements.

However, my /home/mjt/ is 102G with about 50 free.

Time interval: Fri Jun 18 12:41:09 2004 - Fri Jun 18 12:41:14 2004

That's about the only time reference I have. The time is now about 14:00.

How should it take?
The thing is, I'm leaving with my desktop computer in a few hours, so I
may have to cancel and restart later. I also don't want to re-do this, as
I'll be busy until Sunday with more pressing matters.

Are there any risks in using the read-only mounted /home/ while fscking?

Are there any risks in using the /home/ read-write without the stat data
extensions, or whatever --fix fixes?

Is there some more verbosity coming into fsck, just to let me know it's
actually doing something? Sure, I follow it with top -d1 but that's
not too reassuring. Maybe some counter of how many {kilo,mega,giga}bytes
left to check or some tree numbers or _anything_.

Thanks a million!

-- 
mjt

