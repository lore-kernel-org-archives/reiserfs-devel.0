From: Brett Dikeman <brett@cloud9.net>
Subject: count_blocks: block device too large
Date: Sat, 14 Aug 2004 23:56:54 -0400
Message-ID: <a05200f08bd44890d5e38@[192.168.1.2]>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi all,

I'm having a problem with a 360GB filesystem (85-ish GB free) which 
needs checking after a power failure took down the machine. It mounts 
cleanly and might be OK, but given that this is where I store all my 
important stuff(hardware RAID 5), I want to make absolutely sure it's 
OK before I start writing to it again.  Unfortunately, this -is- "the 
backup" solution- I don't have anything nearly big enough to store 
280GB of data on.

Attempts to run reiserfsck have resulted in:

count_blocks: block device too large
Aborted

Nothing is logged to syslog.

The system is running 2.4.23(vanilla), P3, with a Promise SATA raid 
card (which I wouldn't recommend to anyone due to lack of support for 
2.6, or any current distros, but has otherwise performed flawlessly). 
reiserfsck was compiled with gcc 3.3.4, and the system is running 
Gentoo.

I am considering upgrading to 2.4.27 in case this was some obscure 
driver bug, but I doubt that will lead to anything.

Any suggestions?  I've had no help from anyone in the gentoo 
community; it's way over their heads. The best suggestion was 
"specify the device size in blocks", but the man page shows no way to 
do so.

Does anyone have any suggestions?

Thanks,
Brett
-- 
