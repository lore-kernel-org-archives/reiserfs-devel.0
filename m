From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680 corruptions
Date: Sat, 21 Jun 2003 00:43:24 +0200
Message-ID: <3EF38E0C.3020705@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF20728.2080905@g-house.de> <3EF2F315.2080306@g-house.de> <20030620122946.GA24875@namesys.com> <3EF316C7.7010209@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF316C7.7010209@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Christian Kujau schrieb:
>> Ok, I am looking into this.
>> In fact this "non-matching blocks" stuff is not dangerous to actual data.
> 
> are you sure? when even "diff" says that the files are different, the 
> data is wrong in some way.
> 
> under /lib are modeuls, inserting them is fine. however, the copied 
> files (modules) gaive only a segfault!

now i have even more time to answer this: data is indeed corrupt on the 
reiserfs. when i saw "segmentation fault" on stdout, i mean a 
kernel-Ooops (but no freeze!) in the logs. so modules on the ReiserFS 
could no be loaded, diff's are shown, .gz files are not "OK".

>> I am interested in what will happen if you'd do a cp -a/diff -r on a
>> freshly formatted reiserfs, will there be any differences?
>> (and send me output of diff in this case.)

i have copied all data from the said ReiserFS to another partition and 
have now 2GB of spare media to test on. i want to explain an issue here, 
i hope i am not confusing: /var/cache/apt-proxy is the said ReiserFS. i 
noticed corruptions now and "some time ago". but there is data on far 
longer. i was able to cp all data from /var/cache/apt-proxy to another 
fs, a "diff -r" showed *no* differences. i deleted everything under 
/var/cache/apt-proxy and copied all from my apt-proxy backup to 
/var/cache/apt-proxy again. then diff showed differences.
like this:

# cp -a /var/cache/apt-proxy /backup
# diff -r /var/cache/apt-proxy /backup/apt-proxy
(showed 0 (zero) differences)
# rm -rf /var/cache/apt-proxy/*
# cp -a /backup/apt-proxy/* /var/cache/apt-proxy
# diff -r /backup/apt-proxy/ /var/cache/apt-proxy
(showed errors, a following reiserfsck brought corruptions again.)

i have now remformatted /dev/sde1 (*) with ReiserFS, but the symptoms 
behave the same. i'm still using 2.5.72 on an alpha. oh, yes, there is 
*one* patch used, i'll post it here for the record, but i don't think it 
has anything to do with the problem:

-------------
--- 2.5.72/arch/alpha/kernel/srmcons.c	Mon Jun 16 16:00:39 2003
+++ linux/arch/alpha/kernel/srmcons.c	Mon Jun 16 16:13:17 2003
@@ -291,6 +291,7 @@ srmcons_init(void)
  		driver->type = TTY_DRIVER_TYPE_SYSTEM;
  		driver->subtype = SYSTEM_TYPE_SYSCONS;
  		driver->init_termios = tty_std_termios;
+		tty_set_operations(driver, &srmcons_ops);
  		err = tty_register_driver(driver);
  		if (err) {
  			put_tty_driver(driver);
-------------

without this, 2.5.72/2.5.72 would not compile.

i tried the tests with default mount options, often "-o notail" (via 
fstab) was used, same results.

the output of "diff -r ..." was not "only in directory..." but:

Binary files /lib/modules/2.5.70/kernel/drivers/block/floppy.ko and 
/var/cache/apt-proxy/lib/modules/2.5.70/kernel/drivers/block/floppy.ko 
differ

and as i said before: loading the latter one gave me an Oops in the logfile.

i'll restest with the "newest reiserfsprogs" from namesys, since i have 
3.6.6. here (from debian testing)

Thanks,
Christian.


(*) it used to be sde2, but i have re-paritioned sde into one single 2GB 
sde1 to test on.

