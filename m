From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2 vanilla
 kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Thu, 26 Aug 2010 13:03:26 +0200
Message-ID: <4C7649FE.80604@gmail.com>
References: <4C75BCBF.6010009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C75BCBF.6010009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "K. Posern" <quickhelp@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

K. Posern wrote:
> Hi,
>   

Hello.

> First off: I am using reiser4 since YEARS now without the slightest
> problem and I *LOVE* it! Except for deletes of large files on my SSD
> drive it is VERY FAST and stable!
>
> But now I think I might have found a bug:
>
> If I compile javahelp on the reiser4 partition (mounted without any
> special options), I get:
>
> # du -h ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
> 120K	./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
> # ls -la ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
> -rw-r--r-- 1 portage portage      0 Aug 25 16:35
>   

Is it reproducible?
Any suspicious kernel messages being?
Also could you please fsck the partition (I wonder if there are any 
orphan things)

It might be because of this verrry ancient bug, which has been caught, 
but not yet fixed:
http://marc.info/?l=reiserfs-devel&m=127533196521722&w=2

Thanks for report,
Edward.

> ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
>
> I am not sure what the 0 usually refers to, but I think it should not be
> 0, right?
> Because if I do the same thing on a ramdisk or on an ext4 partition:
>
> # du -h ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
> 128K	./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
> # ls -la ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib
> -rw-r--r-- 1 portage portage 121831 Aug 25 16:54
> ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
>
> How can I further investigate?
> And/Or
> What other informations would you need to further track down the problem?
>
> Thanks for any advise!
>
> Best,
>
> Knuth
>
>   

