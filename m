From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: what does this error means?
Date: Thu, 27 Feb 2003 00:04:36 +0300
Message-ID: <200302270004.36393.vitaly@namesys.com>
References: <1046290204.11009.138.camel@cjk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1046290204.11009.138.camel@cjk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Didelot Loic <ldidelot@luxadmin.org>, reiserfs-list@namesys.com

On Wednesday 26 February 2003 23:10, Didelot Loic wrote:
> Checking S+tree../  1 (of   2)/ 34 (of 121)/101 (of 170)bad_leaf: block
> 18800 has invalid item 0: 44081 88932 0x3bf46180 DIR (3), len 2237,
> location 1859 entry count 36, fsck need 0, format old
>
>
>
> thanks in advance,
> didelot loic.

smth wrong with the directory (item # 0, key [44081 88932]) which is located 
in the block # 18800 was detected. 

btw, it seems you are using quite old progs, you should update it.

-- 

Thanks,
Vitaly Fertman
