From: Manfred Larcher <manfred.larcher@grufo.com>
Subject: reiserfsck failed, permission denied, 3.x.1b (2002) SuSE
Date: Sat, 18 May 2002 08:39:24 +0200
Message-ID: <200205180839.24065.manfred.larcher@grufo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

after getting the message "permission denied" as root user on some of my files 
I startet reiserfsck and got the following error message:

> bad_leaf: block 1607938 has invalid item 24: 158466046 65535 0xeeb0000 ??? (
> 15), len 4248, location 0 entry count 1338, fsck need 0, format new
> bad_leaf: block 1607938 has wrong order of items
> ok
> Comparing bitmaps..free block count 764152 mismatches with a correct one 764
> 306.
> on-disk bitmap does not match to the correct one. 154 bits differ
> on-disk bitmap does not match to the correct one.
> Fatal corruptions were found, Semantic pass skipped
> There were found 49 corruptions which can be fixed only during 
>  --rebuild-tree

Ok, so I startet the --rebuild-tree and got a new error message (after waiting 
some hours...):

> 0%....10%....20%....40%..pass0.c 1212 do_pass_0       left 9626336, 625 /sec
> not data block found, 9502720
> Aborted

And now I don't know what else I could do!

My Systems run's with SuSE 8.0 (kernel 2.4.18 SMP) and the hard-disk which 
causes the problem is installed as my second disk. It is an Maxtor 80 GB 
disk. Reiserfsck-Version is 3.x.1b (2002). There is no other operating-system 
installed.

Should I try a newer version of reiserfsck - and if which one?
What else can I do, is there a way to check only from the point where it 
stopped the last time - checking the whole disk needs several hours!?

Thank you
Manfred
-- 
------------------------------------------------
Manfred Larcher
manfred.larcher@grufo.com

Tel.: +43/699/17 10 50 50
Fax: +43/5372/61654
www.grufo.com
------------------------------------------------
www.edelweiss-grossarl.at
www.oberlandliga.com
www.kathrein-gmbh.com

