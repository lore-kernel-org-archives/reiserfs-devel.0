From: Hans Reiser <reiser@namesys.com>
Subject: short term task list for Reiser4
Date: Tue, 11 Jul 2006 15:04:20 -0700
Message-ID: <44B42064.4070802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932170AbWGKWEU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@namesys.com>
Cc: LKML <linux-kernel@vger.kernel.org>

Please feel free to comment on this list and the order of its tasks:

0) fix all bugs as they arise

1) get batch_write into the -mm kernel --- small task

2) get read optimization code into the -mm kernel (coded and probably
debugged but not fully tested and not sent in yet) --- small task

3) get EVERYTHING into wiki (migration has started already, thanks flx).

4) review complaints of pauses while using reiser4 --- size of task
unknown, and it is also unknown how much we may have fixed it while
writing recent patches.

5) review crypt-compress code --- full code review --- substantive task

6) optimize fsync --- substantive task which requires using fixed area
for write twice logging, and using write twice logging for fsync'd
data.  It might require creating mount options to choose whether to
optimize for serialized sequential fsyncs vs. lazy fsyncs.

7) review all of our installation instructions --- I am already doing
that, but volunteers who will help out our wiki would be sorely
appreciated.  Installing reiser4 as the root for each distro needs
step-by-step instructions.

8) review our kernel documentation --- I should do that but when will I
have time?

Unfortunately, our code stability is going to decrease for a bit due to
all these changes to the read and write code --- no way to cure that but
passage of time.   On the other hand, our CPU usage went way down. 
Reiser4's only performance weakness now is fsync.  

Once the crypt-compress code is ready, we will release Reiser4.1-beta
(with plugins, releasing a beta means telling users that if they mount
-o reiser4.1-beta then cryptcompress will be their default plugin, and
if they don't, then they are using Reiser4.0 still).  Doubling our
performance and halving our disk usage is going to be fun.
