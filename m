From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: lvm+loop-aes+reiserfs / iput deadlock fix
Date: Mon, 27 Jan 2003 00:11:37 +0100
Message-ID: <5.2.0.9.2.20030127000631.01d7a068@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Oleg, I tried out 
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-fix.diff 
patch on 2.4.20aa1 and this patch DOES improve the situation.
Before I used the patch when I made heavy copying of 10-50 meg files, after 
some time the copying process hung, and WASN'T killable. And also it left 
files that werent deletable, and also left the deleting process hung. and 
many times I wasnt even able to acces the folder where the strange file was 
located.
Now with the iput deadlock fix, the copying process does hang as well, BUT 
it is killable after, and the 'fucked up' file is deletable also.
Regards, and I'm awaiting some more updates,
best wishes,
greg


