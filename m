From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs_create: no enough blocks on device
Date: Wed, 04 Aug 2004 21:23:13 +0400
Message-ID: <41111B81.9020806@namesys.com>
References: <20040802212341.24550.qmail@web50907.mail.yahoo.com> <20040802215322.GB1912@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040802215322.GB1912@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: sankarshana rao <san_wipro@yahoo.com>, reiserfs-list@namesys.com

Hello

Andreas Dilger wrote:
> On Aug 02, 2004  14:23 -0700, sankarshana rao wrote:
> 
>>I am trying to create a reiserfs filesystem using the
>>command 
>>'mkreiserfs  /dev/loop/0 100'.
>>It always gives me the error 
>>"reiserfs_create: no enough blocks on device".
>>
>>I tried altering the block size, but it would not
>>help..
> 
> 
> You can't make a reiserfs filesystem smaller than about 40MB.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/
> 

Experimentally I found that the smallest size of reiserfs is 531 blocks. It will have 512 block of journal.

mkreiserfs-3.6.17 -s 512 /dev/hdb11 531


