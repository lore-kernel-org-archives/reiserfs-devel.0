From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck
Date: Thu, 22 Aug 2002 18:44:08 +0400
Message-ID: <200208221844.08713.vitaly@namesys.com>
References: <1651424343.20020822161642@pch-edv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1651424343.20020822161642@pch-edv.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux PCH EDV <linux@pch-edv.com>, reiserfs-list@namesys.com

On Thursday 22 August 2002 18:16, Peter Herklotz wrote:
> Hello,
>
> how would I know which version of fs 3.5 I use(d)? The filesystem on
> that partition was created using SuSE Linux 7.3.
>
> If I made a wrong choice of the superblock version using "reiserfsck
> --rebuild-sb" can I correct it afterwards?
> At the moment "reiserfsck --rebuild-tree" does not find ANY data on
> the partition. It is telling me
> 'Could not find hash in use. Using "r5"
> "r5" hash is selected'
>
> and then doesn't find anything.
>
> I am quite clueless what to try now.
>
> Thanks
> Peter

Could you tell what you answered here

what is version of ReiserFS you use[1-4]
  (1)   3.6.x
  (2) >=3.5.9
  (3) < 3.5.9 converted to new format
  (4) < 3.5.9
  (X)   exit

If you mkreiserfs by default from SuSe 7.3 you should have >=3.5.9.
It would be easy to say what is going on if you send the reiserfsck 
output and its logfile (-l option). 

Let's check whether you have some data on the partition or not. Could you 
run ./debugreiserfs/debugreiserfs -D /dev/hdb3 > hdb3.meta
If it prints a lot of LEAF NODEs, you have.

-- 

Thanks,
Vitaly Fertman
