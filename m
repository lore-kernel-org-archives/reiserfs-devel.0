From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs vs vxfs
Date: Mon, 17 Feb 2003 16:37:34 +0300
Message-ID: <3E50E59E.4090501@namesys.com>
References: <200302150108.52868.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302150108.52868.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jure pecar <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

jure pecar wrote:

>Hi all,
>
>
>I just had some opportunity to play with the fibrechannel array we recently got. 
>It's done with two qlogic 2300 hbas in multipath setup. I tested with 14 15krpm
>36gb disks.
>
>linux md, 7 mirrors, stripe across them, 64k chunk size, reiserfs
>bonnie++ -d /test -s 4096:8k -n 1024:65536:0:10000 used in all tests
>
>Version  1.03       ------Sequential Output------ --Sequential Input---Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block----Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec%CP
>mai              4G 15643  95 66555  79 63027  72 15686  99 146624  87  1131 5
>                    ------Sequential Create------ --------Random Create--------
>                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>files:max            /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> 1024:65536:0/10000   354  88   270   6  9131  79   343  85    87   3   661  16
>
>
>
>Veritas VM, 'stripped pro' (thats what they call raid10), 128 stripe unit size,
>vxfs mounted with delaylog:
>
>Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>mai              4G 24102  99 79322  74 30739  42 22177  92 83485  45 475.9  19
>                    ------Sequential Create------ --------Random Create--------
>                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>files:max            /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> 1024:65536:0/10000   519  14   470  12  1684  14   464  12    59   3   100   3
>
>
>
>Veritas VM, stripped pro, 64 stripe unit size, vxfs mounted with log:
>
>Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>mai              4G 14594  98 49899  84 21431  49 13886  94 66823  52 475.3  30
>                    ------Sequential Create------ --------Random Create--------
>                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>files:max            /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> 1024:65536:0/10000   337  15   620  16  1906  15   333  16    82   3   112   1
>
>
>
>Veritas VM, stripped pro, 64 stripe unit size, reiserfs:
>
>Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
>Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>mai              4G 15919  99 44442  69 24994  28 14779  98 94095  87  1088   9
>                    ------Sequential Create------ --------Random Create--------
>                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
>files:max            /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> 1024:65536:0/10000   306  78   320  10  8223  76   283  74   102   5   647  19
>
>
>Kernel 2.4.9.e-3 on RH advanced server.
>
>If anyone finds these numbers useful ... 
>
>
>Btw, Veritas vm gui (VEA) offers support for ext2/3. Is it possible that someday 
>we'll see support for reiserfs inthere as well?
>
>
>--
>
>Jure Pecar
>
>
>  
>
what happens if you turnoff tails?

-- 
Hans


