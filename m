From: Zapf@students.uni-marburg.de
Subject: Thanks Nikita/answer: what error
Date: Thu,  2 Oct 2003 18:23:07 +0200
Message-ID: <1065111787.3f7c50eba2045@home.students.uni-marburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all,

Thanks to Nikita who pointed me to the READ.ME file (which I should have read 
before, as its name suggests, rightfully) I found the reason for my errors
(and feel pretty stupid).

I was using test4 instead of test5, this resulted in type errors in 
page_cache.c lines 224 and 237. Maybe there is a higher being that knows why
I thought the patch was for test4.

The reiser4 module compiled now, like it should. I will reboot in a while,
wait until I'm sure the kernel runs acceptably stable, then get the utils and 
try reiser4 on an empty drive. If there is something noteworthy, I will post it
to this list.

happy developing & thanks for the quick help,

	Basti
