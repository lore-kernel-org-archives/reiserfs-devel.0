From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Sat, 17 Aug 2002 23:00:57 +0400
Message-ID: <3D5E9D69.1030109@namesys.com>
References: <200208152007.42370.degerrit@web.de>	<200208152329.40707.degerrit@web.de>	<200208161205.00550.vitaly@namesys.com>	<200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com, god@thebsh.namesys.com, Oleg Drokin <green@namesys.com>

Matthias Andree wrote:

>Gerrit Hannaert <degerrit@web.de> writes:
>
>  
>
>>Anyway, my first instinct told me to try Maxtor's 'Powermax' tool, and
>>lo and behold the 'Advanced Test' here found errors, and 'fixed' them,
>>whatever that means. (Can you believe these guys make you download a
>>3MB Windows executable in order to write a 1.44Mb floppy image which
>>is less than half full?? I had to bloody install Windows for
>>this... grr....)
>>    
>>
>
>So complain and ask them to make a gzipped floppy image for Linux and
>*BSD users, and offer to send them one :-)
>
>  
>
>>I think I will spend the next week working out a better backup
>>solution...
>>    
>>
>
>...and finding out if files have been damaged.
>
>  
>
>>Will Reiserfs4 have better bad block handling than this? When I see all the 
>>trouble involved in rescuing this filesystem, as much as I'm impressed with 
>>it I would think twice about using Reiserfs on any non-redundant (and 
>>certainly IDE) disks from now on. I hope I don't make any enemies by saying 
>>so.
>>    
>>
>
>Any file system can screw up if the hardware fails in the wrong
>place. If what I'd call "file header" blocks are struck, the file name
>(at least) is gone, on some file systems the whole file. So there.
>
>Are there file systems that checksum the files' and directory data, to
>be able to flag files as broken if a bad block strikes?
>
>  
>
Nikita wrote a badblocks patch.

The main reason for resisting doing it is that it is usually better to 
just write to the bad block, and let the hard drive remap the block.

Oleg, maybe send it into 2.5?

Hans

