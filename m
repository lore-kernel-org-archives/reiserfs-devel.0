From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4: reserved disk space
Date: Wed, 28 Mar 2007 18:00:01 +0400
Message-ID: <460A74E1.9000703@namesys.com>
References: <460A5F9A.6070902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <460A5F9A.6070902@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ignatich <ignatich@gmail.com>
Cc: reiserfs-list@namesys.com

Hello.
This is a comment from block_alloc.c:

/*
 * SPACE RESERVED FOR UNLINK/TRUNCATE
 *
 * Unlink and truncate require space in transaction (to update stat data, at
 * least). But we don't want rm(1) to fail with "No space on device" error.
 *
 * Solution is to reserve 5% of disk space for truncates and
 * unlinks. Specifically, normal space grabbing requests don't grab 
space from
 * reserved area. Only requests with BA_RESERVED bit in flags are allowed to
 * drain it. Per super block delete mutex is used to allow only one
 * thread at a time to grab from reserved area.
 *
 * Grabbing from reserved area should always be performed with BA_CAN_COMMIT
 * flag.
 *
 */

Ignatich wrote:

> Reiser4 reserves roughly 5% of partition size for it's internal use. 
> This space can be tens of gigabytes for modern hard disks, and unlike 
> ext2 reserve cannot be used even by root in any way.


use compression ( http://dev.namesys.com/GettingStartedCryptcompress )
and you will save more then 5% of partition size

>
> I changed reserved block count in super.c to be 1% instead of 5%, 
> formatted a test drive in reiser4 and stress tested it by copying many 
> small or few huge files to almost full disk. Everything was working fine.


you will encounter problems when using serious workload

>
> It there a reason for this reserve to be so big?
>

this value is empirical: it is impossible to estimate this precisely

Thanks.

