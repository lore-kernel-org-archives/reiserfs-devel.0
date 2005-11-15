From: Thorsten Hirsch <t.hirsch@web.de>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 23:22:27 +0100
Message-ID: <1132093347.6347.7.camel@bauerbob.hirsch.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: t.hirsch@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I've seen the mails in the mail archive concerning a slow-down problem
with reiser4. Seems like I've got the same problem. My kernel is
2.6.14-mm2 (gentoo) and my default disk scheduler is anticipatory, but
I've also tried cqf and I'd say that it depends on the application for
which scheduler might be a bis faster. But they're both very slow and my
load is very high.

I've found out, that resizing the columns in evolution is also for me a
good proof of this problem as it really creates a lot of hard disk
activity. So I've done the same strace call as Craig Shelley:

bauerbob ~ # echo anticipatory > /sys/block/hda/queue/scheduler
bauerbob ~ # strace -T -p 6336 2>&1 | grep fsync
fsync(52)                               = 0 <1.812899>
fsync(52)                               = 0 <0.734160>
fsync(52)                               = 0 <0.427722>
fsync(52)                               = 0 <0.839306>
fsync(52)                               = 0 <0.304873>
fsync(52)                               = 0 <0.236160>
fsync(60)                               = 0 <0.469446>
fsync(60)                               = 0 <0.460405>
fsync(60)                               = 0 <0.468343>
fsync(61)                               = 0 <0.745482>
fsync(61)                               = 0 <0.869358>
fsync(64)                               = 0 <1.500842>

bauerbob ~ # echo cfq > /sys/block/hda/queue/scheduler
bauerbob ~ # strace -T -p 6336 2>&1 | grep fsync
fsync(52)                               = 0 <3.131074>
fsync(52)                               = 0 <0.806179>
fsync(52)                               = 0 <0.341460>
fsync(52)                               = 0 <0.212601>
fsync(52)                               = 0 <0.251179>
fsync(52)                               = 0 <0.614537>
fsync(52)                               = 0 <0.246023>
fsync(52)                               = 0 <0.238064>
fsync(52)                               = 0 <0.386216>
fsync(52)                               = 0 <0.205596>
fsync(52)                               = 0 <0.250840>
fsync(52)                               = 0 <0.246623>
fsync(52)                               = 0 <0.242773>

PID 6336 is evolution.
Please let me know how I can help you.


Best regards,
Thorsten

