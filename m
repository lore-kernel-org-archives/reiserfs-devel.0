From: michael@crosscode.org
Subject: Re: reiserfsck hangs (reiser3)
Date: Tue, 8 Feb 2005 18:40:19 -0500 (EST)
Message-ID: <Pine.LNX.4.61.0502081838400.2762@heidi.crosscode.org>
References: <Pine.LNX.4.61.0502071633170.2762@heidi.crosscode.org>
 <200502081208.07631.vitaly@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502081208.07631.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

 	Ok, done.

 	http://www.crosscode.org/~michael/reiser/dev_media_all-meta.bz2

 	Only 12MB :)

Thanks
- Michael

On Tue, 8 Feb 2005, Vitaly Fertman wrote:

> On Tuesday 08 February 2005 02:10, Michael P. Cosby wrote:
>> Short description:
>>  	reiserfsck --rebuild-tree hangs for over 24 hours while attempting to
>> repair my filesystem. This happens no matter how many times I run
>> reiserfsck v3.6.19
>>
>> Environment:
>> linux 2.6.10 (debian)
>> reiserfsck v3.6.19
>> resize_reiserfs v3.6.19
>> LVM (v2.6 style)
>>
>> long description:
>>  	I had 3 200GB drives joined together into a single partition via LVM,
>> with reiserfs on top of that. At the time I was using kernel 2.6.8.1.
>> Timeline:
>>
>> First day
>> -----
>> * one drive in the LVM began giving me bad sector errors
>> * bought a new drive to replace it that was 3GB smaller
>> * attempted to resize the reiser fs, which failed due to bad sectors
>> * bought a different new drive, used LVM (pvmove) to move the data from the
>>  	failing drive to the new one
>> * verified the disk I took out was bad, got an RMA and shipped it back
>> * ran reiserfsck, which completed and gave me the "use --rebuild-tree
>> option" * ran reiserfsck with rebuild-tree, got bad sector errors from
>> another drive (I've since decided my problem was overheating).
>>
>> A few days later (and then some)
>> -----
>> * got another drive to replace the second failing drive, used LVM (pvmove)
>> to copy the data from the failing drive to the new one
>> * ran reiserfsck --rebuild-tree
>> * about 45% of the way through pass 2, reiserfsck hangs. Random samples
>> show it using between 40 and 70% of processor time, giving me the
>> impression it's not really hung (I expect a program that's actually hung to
>> use either 0% of 100% cpu time). So I left it for about 6 hours, stopped it
>> and tried again. This time I tried it with the -S switch and it hung, but
>> in a different spot. At that point I upgraded to linux 2.6.10. I tried it
>> again and left it for 12 hours before I had to reboot (to take the bad
>> drive out). I ran it a fourth time, added the -z option, and waited a full
>> 24 hours, after which I've come to the conclusion that it really is hung.
>>
>>  	I've attached the logfile from the last run. If you need any more
>> information or need me to run tests, please let me know. I can send you any
>> portion of the disk that you need (the data on it is not particularly
>> sensitive) but of course it's hard to send the full 600GB worth of raw data
>> :)
>>
>>  	Thank you very much for any help you can provide.
>
> let's try to pack the fs metadata with:
> 	debugreiserfs -p <device> | bzip2 -c > <device>-meta.bz2
> they probably will be not so large for downloading.
>
> -- 
> Thanks,
> Vitaly Fertman
>
>
