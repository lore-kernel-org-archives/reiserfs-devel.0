From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: SuSE 9.0 reiserfsprogs-3.6.9. When will we see an update?
Date: Mon, 1 Dec 2003 19:31:01 +0100
Message-ID: <200312011931.01285.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

Hello Chris,

some time has passed...;-)

I had a bad system corruption due to a broken system disk. My IBM U160 disk 
(DDYS-T18350; 18,2 GB; 10k RPM) was broken for the third time...
Now I replaced it with two (RAID1) Fujitsu MAS3184NP (U320; 18,4 GB; 15k RPM; 
65-78 MB/s (inner to outer)) and SUSE 9.0 on LVM.

After a power loss I got some files in "lost+found" from "/opt" (last 
accessed) and reiserfsck was relative slow (reiserfsprogs-3.6.9).
Reiserfsprogs-3.6.11 and -pre12 is way faster (on my old SuSE7.3 based system) 
and there where some fixes.

I tried to compile them on SuSE 9.0 as always but I failed 'cause SuSE patched 
some things.

Can you give some advice?

Thanks and greetings.

-Dieter
