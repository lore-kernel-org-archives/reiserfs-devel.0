From: Kir Kostuchenko <kir@users.sf.net>
Subject: Re: reiserfsck bug
Date: Thu, 06 May 2004 14:14:54 +0600
Message-ID: <4099F3FE.5080902@users.sf.net>
References: <40994D84.1010901@users.sf.net> <200405061159.59882.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405061159.59882.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>Hello,
>
>On Thursday 06 May 2004 00:24, Kir Kostuchenko wrote:
>  
>
>>    hi, I've got error message from the reiserfsck 'out of disk space',
>>in the rebuild tree mode.
>>
>>    I think it's a bug of reiserfsck, I can send you bzip2'ed image of
>>the partition.
>>
>>    Please help.
>>    
>>
>
>If a file item offset is broken this sometimes looks like some items 
>are lost and the hole is inserted, the needed space is proportional to
>the hole size in reiserfs, this is why fsck may run of disk space. The 
>standard solution here is to find a larger partition, zero it (or enlarge 
>the existent one and zero the added part), make a raw copy of the 
>problem partition to it, run reiserfsck --rebuild-sb and then reiserfsck 
>--rebuild-tree.
>  
>
    Thanks.

    So, if I only have a file with raw copy of my partition, I should do 
something like:

// make 1 gb additional space
# dd if=/dev/zero of=additional_space bs=1000k count=1000

// add to my raw bad partition copy
# cat additional_space >> bad_partition

// map to the loop device
# losetup /dev/loop0 bad_partition

// run reiserfsck with --rebuild-sb
# reiserfsck --rebuild-sb --rebuild-tree /dev/loop0

    Am I right?

>Although it could be another reason, if you make the packed metadata:
>	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
>and provide them for downloading, I will investigate if there is some 
>bug.
>
    If my previous step will cause an error, send metadata to you?

