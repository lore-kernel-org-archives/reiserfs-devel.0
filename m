From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Tue, 4 Jun 2002 11:45:40 -0500
Message-ID: <OF11EA668C.45750304-ON85256BCE.005BA51F@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com



>Hm. Yes, I in fact had everything in modules.
>But I have expected evms to load all the stuff its needed once evms main
module
>is loaded.
>It would be helpful if help entry on EVMS suggest evms might be loaded as
>module, but then all of the other evms modules should be loaded by hand.

Yes, that would be nice. We are working on making this better.

>> We recommend compiling all EVMS runtime plug-in that you plan to use
>> directly into your kernel.  It avoid the hassle of dealing with init
>> ramdisks and lodaing modules at the right time.  If you are really set
on

>Since I am not planning to put my root on a EVMS volume yet, I think I can
>go with modules setup, I only need to load all the modules, it seems.

Ok, don't forget that after loading the modules that you will have to run
'evms_rediscover' to get everything picked up in the kernel.

>> Summary: please verify that at least 'local device manager' and 'DOS
>> partition manager' are built statically into the kernel, if not
reconfigure
>> kernel and retry.  If they are, then send me the kernel and Engine logs
and
>> I will see what is wrong.

>>Ok, thank you.  will try that.

I think you are almost there.  If you have any trouble after today, please
post to the evms-devel mailing list as I am leaving on a business trip in a
few hours and am not sure if/when I will have email access.

Steve



