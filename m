From: Hans Reiser <reiser@namesys.com>
Subject: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 14:28:32 +0300
Message-ID: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS <reiserfs-list@namesys.com>

We were discussing how to optimize reiser4 best, and came to realize 
that us developers did not have a good enough intuition for what users 
do that stresses their filesystem enough that they care about its 
performance.

If you just do edits of files it probably does not matter too much what 
fs you use.

Booting the machine seems like one activity that many users end up 
waiting on the FS for.  Yes?

Starting up complex and big applications like xemacs and mozilla would 
be another.  Yes?

Others?

Hans

PS

reiser4 performance is up a lot recently, and within two weeks I think 
cp -r will have been optimized as much as is worth doing.  cp -r 
accesses files in readdir order, and that does indeed seem worth 
optimizing, but soon we will need to optimize more sophisticated access 
patterns than that.....

Hans

