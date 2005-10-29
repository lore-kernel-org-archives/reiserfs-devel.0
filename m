From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 SCSI Bug?
Date: Sat, 29 Oct 2005 16:18:20 -0700
Message-ID: <4364033C.5010200@namesys.com>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU> <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU> <43639DFA.1020107@namesys.com> <43640228.7080807@wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43640228.7080807@wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Isaac Chanin <chanin@WPI.EDU>
Cc: Steve Olivieri <steve86@WPI.EDU>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Isaac Chanin wrote:

> Hi Hans,
>
> I don't think it's a device driver problem.  My fix derived simply
> from noticing that the function where the problem originates is
> bvec_alloc_bs in fs/bio.c.
>
> To trace, the problem goes something like:
> (fs/reiser4/wander.c) write_jnodes_to_disk_extent -> (fs/bio.c)
> bio_alloc -> bio_alloc_bioset -> bvec_alloc_bs
>
> In any case, BIO_MAX_PAGES is defined to be 256 in
> include/linux/bio.h, thus bvec_alloc_bs returns null, likewise
> bio_alloc_bioset does the same, as does bio_alloc.  And thus the error
> in wander.c.
>
> Looking at the problem from the other direction, the max_blocks check
> that was already in wander.c looks like:
>
> max_blocks = bdev_get_queue(super->s_bdev)->max_sectors >>
> (super->s_blocksize_bits - 9);
>
> I'd look into the construction of the super block around
> s_blocksize_bits, or however max_sectors is derived, to see if
> there're any problems there (I suppose a device driver very well could
> be giving a bad value that gets used somewhere in that code), but I
> really don't know the reiser4 code well enough to do so.  In any case,
> as a temporary (or perhaps permanent, as it seems that the limit is
> hardcoded in the kernel anyways) solution it would probably be better
> to put the min(256, ...) 

It should be not 256, but BIO_MAX_PAGES, yes?   Defining limits in two
places is bad, yes?

> check around where max_blocks is set rather than around nr_blocks
> inside the while loop.
>
>
> Isaac
>
>
> Hans Reiser wrote:
>
>> Thanks Isaac!
>>
>> Does IDE have a different maximum?  Is there a non-hack way to discover
>> the maximum of the device driver underneath?
>>
>> Hans
>>
>> Isaac Chanin wrote:
>>
>>
>>> Steve Olivieri wrote:
>>>
>>>
>>>
>>>> Greetings!
>>>>
>>>> I have a Maxtor Atlas II 15k, 147GB SCSI hard disk and an LSI Logic
>>>> LSI21320 Ultra320 SCSI Host Bus Adapter for PCI-X (though it's
>>>> running in
>>>> a PCI slot).  I have partitioned it and installed a temporary Gentoo
>>>> system with the reiserfs filesytem.  My boot partition uses ext2. 
>>>> These
>>>> partitions seem perfectly stable.  I have booted this temporary system
>>>> multiple times and I have attempted to use it to install a permanent
>>>> system with the reiser4 filesystem.
>>>>
>>>> After making the fileystems on each partition and mounting them, I was
>>>> able to download two tarballs (the stage and portage snapshot).  While
>>>> extracting the first, the terminal seems to hang.
>>>>
>>>> I switched to another terminal to see what was wrong.  Everything
>>>> works
>>>> great until I try to do anything at all on a reiser4 partition.  Then,
>>>> this terminal also hangs.  Repeat until I'm out of terminals.
>>>>
>>>> I've been able to repeat this problem a number of times.  The only
>>>> messages in my log file claimed that a flush failed (with code -12,
>>>> if I
>>>> remember correctly).  I do not have access to the logs at this time
>>>> but I
>>>> will try to get them soon.
>>>>
>>>> I am running a 2.6.13-ck8 kernel patched with the 2.6.13 reiser4
>>>> patchset.
>>>> Patitions were made using the 1.0.5 reiser4progs/libaal.  In the
>>>> past, I
>>>> have also replicated this problem using a 2.6.12-gentoo kernel with
>>>> the
>>>> 2.6.12 patchset and 1.0.5 reiser4progs/libaal.
>>>>
>>>> Is there something that I can do to fix this problem?  Is it a
>>>> known bug?
>>>>
>>>> Also, I am not on the mailing list and I would appreciate it if I
>>>> could be
>>>> cc'd with any information about this problem.
>>>>
>>>> Thanks,
>>>> Steve
>>>>
>>>>
>>>>
>>>>
>>>>  
>>>
>>>
>>> Hey Steve,
>>>
>>> The problem appears to be in the fs/reiser4/wander.c file.  In short,
>>> nr_blocks passed to bio_alloc ends up being too big; in my testing
>>> 1024,
>>> whereas the maximum the called functions will properly deal with is
>>> 256.
>>>
>>> The attached patch adds a hacky fix for this problem, but perhaps
>>> someone
>>> who knows the code better should go through and take a look why
>>> max_blocks
>>> and nr in write_jnodes_to_disk_extent in wander.c do not always have a
>>> shared minimum of no greater than 256.
>>>
>>> Hope this helps,
>>> Isaac
>>>
>>>
>>> ------------------------------------------------------------------------
>>>
>>>
>>> --- /mnt/gentoo/usr/src/linux/fs/reiser4/wander.c    2005-10-28
>>> 19:27:02.301541280 -0400
>>> +++ linux/fs/reiser4/wander.c    2005-10-28 19:29:37.000000000 -0400
>>> @@ -1241,7 +1241,7 @@
>>>
>>>     while (nr > 0) {
>>>         struct bio *bio;
>>> -        int nr_blocks = min(nr, max_blocks);
>>> +        int nr_blocks = min(min(nr, max_blocks), 256);
>>>         int i;
>>>         int nr_used;
>>>
>>>
>>
>>
>>
>
>

