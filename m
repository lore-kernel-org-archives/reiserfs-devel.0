From: Peter Herklotz <linux@pch-edv.com>
Subject: Re[2]: reiserfsck
Date: Thu, 22 Aug 2002 17:29:37 +0200
Message-ID: <75799125.20020822172937@pch-edv.com>
References: <1651424343.20020822161642@pch-edv.com>
 <200208221844.08713.vitaly@namesys.com>
Reply-To: Linux PCH EDV <linux@pch-edv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208221844.08713.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

> Could you tell what you answered here

> what is version of ReiserFS you use[1-4]
>   (1)   3.6.x
>   (2) >=3.5.9
>   (3) < 3.5.9 converted to new format
>   (4) < 3.5.9
>   (X)   exit

> If you mkreiserfs by default from SuSe 7.3 you should have >=3.5.9.
> It would be easy to say what is going on if you send the reiserfsck 
> output and its logfile (-l option).

I opted for "(2) >=3.5.9" which - after having read your answer -
seems to have been to be the right choice since I installed the fs
with default options from SuSE 7.3.

The output from the log is:

####### Pass 0 #######
Could not find hash in use. Using "r5"
####### Pass 1 #######
####### Pass 2 #######


> Let's check whether you have some data on the partition or not. Could you
> run ./debugreiserfs/debugreiserfs -D /dev/hdb3 > hdb3.meta
> If it prints a lot of LEAF NODEs, you have.

No, it simply tells me:
'Loading on-disk bitmap .. 9372 bits set'
Then it "counts" from 0 to 100 percent - that's it.

What might have happened here? Seems quite mysterious to me.

Thanks
Peter

