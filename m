From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Mon, 23 Jun 2003 15:38:20 +0200
Message-ID: <3EF702CC.9050005@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF6C83F.6060702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

hi again,

i did some further testings on this issue and the results are as follows:

as stated before, the corruptions occur only on this very alpha machine, 
i386 (2.5.72) is not affected here.

i staretd the alpha then with a 2.4.21. i created an fs on /dev/sde2, 
reiserfsck passed with no errors. i mounted the partition, copied /lib 
to it, diff showed _no_ differences, which was good. then something 
unexecpected happened: i unmounted the partition right after the 
"diff..." finished and wanted to reiserfsck the patition again, but this 
time reiserfsck complained about:

[...]
The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
[...]
that so many blocks have gone bad that none remain in
reserve to allocate.
 

bread: Cannot read the block (523914): (Input/output error).

hah! i was not aware that the disk might have an hw problem, not a 
single error ever showed up in my logs. this was weird. so i 
re-partitioned the disk with a 10MB sde (to circumvent the bread error) 
on the beginning and a 2 GB sde2. now reiserfsck/cp/diff are all working 
fine under 2.4.21, but 2.5.72 is still erroneous.

btw: i am still using reiserfsprogs 3.6.8 now (since debian/testing has 
3.6.6) and i have compiled these utils under a 2.5.72 kernel. is it safe 
to use them under 2.4 ?

thanks,
Christian.

