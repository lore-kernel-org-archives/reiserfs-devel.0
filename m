From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Some kind of benchmark
Date: Wed, 02 Jun 2004 13:35:51 +0400
Message-ID: <1086168950.24589.4.camel@tribesman.namesys.com>
References: <200406011832.30163.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406011832.30163.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-06-01 at 20:32, Marcel Hilzinger wrote:
> I tested reiser3.6, reiser4 and ext3 with the compiled kernel source 2.6.5.
> I made 6 5 GB partitions at the end of a 60 GB disk and formatted always two
> of them with above file systems:
> /hda6: reiser3
> /hda7: ext3
> /hda8: reiser4
> /hda9: reiser3
> /hda10: ext3
> /hda11: reiser4
> 
> then I copied the compiled kernel source from one partition to another always 
> within the same file system. The commands I used:
> write: time cp -a linux-2.6.5/ /$FS
> rewrite: time cp -a linux-2.6.5/ /$FS
> delete: rm -r /$FS/linux-2.6.5
> 
> In one test I made these steps 7 times without breaks. And I made several 
> tests. Here the results (just averages)
> 
> FS			write				rewrite			delete
> SUSE 9.1 with SUSE kernel:
> ext3		01:25,81				01:34,02				00:05,54
> reiser3	01:17,57				01:35,90				00:03,35
> Same system with kernel 2.6.5
> ext3		01:25,50				02:10,31				00:11,56
> reiser3	01:21,91				01:58,18				00:06,67
> reiser4	00:40,46				02:10,26				00:12,83
> 
> 
> Yes, reiser4 is fast :-) !!
> 
> Question: Why may be rewriting and delete (almost 2 times) slower on 2.6.5 
> kernel than on SUSE 2.6.4 kernel?
> 

Suse kernel differs from stock one substantially. I guess. So, it is
very likely that those changes (which are not reiserfs only, certainly)
are responsible for that difference.
When suse experts will wake up they will say more details about what
might cause overwrite speedup

> Marcel
> 
> u.i. Tests with big files will follow :-)

