From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 01:02:04 +0200
Message-ID: <3EFCCCEC.9090603@g-house.de>
References: <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EFCC72F.9020100@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Christian Kujau schrieb:
> address. let me repeat, that not _all_ files in the fs are corrupted.
> the two textfiles i have just written into the newly created reiserfs
> are _not_ different from their origins. however, when i copy many files,
> a certain amount of files get corrupted.
> 

that said, i've done some testings (yes, i really have time-> holidays!)
to find out the amount of files triggering the corruptions. started with 
10, 20, 200 (text)files gave me _no_ corruptions. i was already about 
doubting myself, that i copied again my /lib to the fresh fs:

lila:~# mount -o loop test.img /mnt/bench/
lila:~# /bin/cp -a /lib/ /mnt/bench/
lila:~# find /lib/ | wc -l
     475
lila:~# diff -r /lib/ /mnt/bench/lib/ | wc -l
diff: /lib/modules/2.5.65/build: No such file or directory
diff: /mnt/bench/lib/modules/2.5.65/build: No such file or directory
diff: /lib/modules/2.5.69/build: No such file or directory
diff: /mnt/bench/lib/modules/2.5.69/build: No such file or directory
diff: /lib/modules/2.5.70/build: No such file or directory
diff: /mnt/bench/lib/modules/2.5.70/build: No such file or directory
     168
lila:~#

(the warnings are ok, these are correct dead links.)

so, it's 168 out of 475--> 35%. but i still don't know the exact amount 
of file needed to get a corruption. (even with 200 files i should get 70 
corruptions...)

if that would be important/helpful i could do further tests...

Christian.

