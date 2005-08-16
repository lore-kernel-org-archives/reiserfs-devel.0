From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 sending process to D state
Date: Tue, 16 Aug 2005 14:38:01 +0400
Message-ID: <4301C209.7000302@namesys.com>
References: <43012902.1010600@webalive.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43012902.1010600@webalive.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mohammad.rahman@webalive.biz
Cc: reiserfs-list@namesys.com

Hello

Mohammad A. Rahman wrote:
> Hello,
> 
> I am having an issue with reiser4. I am wondering if it is a known issue 
> for reiser4 or I have missed something along the path.
> 
> #cat /etc/redhat-release
> Red Hat Enterprise Linux ES release 3 (Taroon Update 5)
> 
> Downloaded 2.6.12 vanila kernel, applied mm2 patch (2.6.12-mm2) and then 
> aapplied reiser4 patch downloaded from namesys for 2.6.12-mm2 
> (ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12-mm2/reiser4-vfs-3.patch). 
> Kernel compiles and boots ok.
> 
> Compiled libaal-1.0.5 and reiser4progs-1.0.5 with ./configure, make and 
> make install.
> 
> Created reiser4 fs on my disk (/usr/local/sbin/mkfs.reiser4  /dev/sda5)
> 
> Mounted the partition (/dev/sda5               /test                   
> reiser4 defaults        1 2)
> 
> "dmesg | grep reiser" shows:  loading reiser4 bitmap......done (181 
> jiffies)
> 
> But when I try to write big amount of data on that partition the process 
> hangs and goes to uninterruptible sleep (D) state.
> 
> the PS output shows:
> 
> root      2375  2.7  0.0  3828  692 pts/1    D    23:21   0:15 cp -i -r 
> /usr .
> 
> I can easily simulate it with  bonnie++
> 
> bonnie++ -u user:user -d /test -s 4096m -m hudson -n 32:100000:16:256 -b -q
> 
I just tried that on 2.6.12-mm2 + ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12-mm2/reiser4-vfs-3.patch.
And I am afraid I was not able to reproduce the problem:

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
hudson           4G 17979  81 36327  21 18649  15 16293  70 40979  13  93.0  25
                     ------Sequential Create------ --------Random Create--------
                     -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
    32:100000:16/256    42   5   307   9   203  12    41   5    72   2    22   1
hudson,4G,17979,81,36327,21,18649,15,16293,70,40979,13,93.0,25,32:100000:16/256,42,5,307,9,203,12,41,5,72,2,22,1

can you please provide more information about your environment: amount of ram, SMP or UP, etc.

