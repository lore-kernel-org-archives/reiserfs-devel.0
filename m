From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 status (correction)
Date: Sun, 23 Jul 2006 00:19:47 -0600
Message-ID: <44C31503.9000005@namesys.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com>	 <1153517853.6659.56.camel@ipso.snappymail.ca>	 <44C157D2.5060202@slaphack.com>	 <1153525982.6659.108.camel@ipso.snappymail.ca>	 <44C191FD.4010302@slaphack.com>  <44C1BD65.8070204@namesys.com>	 <1153558557.6659.152.camel@ipso.snappymail.ca>	 <44C21B3A.9050000@slaphack.com> <1153598173.6659.219.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153598173.6659.219.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:

>On Sat, 2006-07-22 at 07:34 -0500, David Masover wrote:
>
>  
>
>>The compression will probably mostly be about speed.  Remember, if
>>we're 
>>talking about people who want to see tangible, visceral results,
>>we're 
>>probably also talking about end-users.  And trust me, the vast
>>majority 
>>of most of my data (as an end-user) is not very compressible.
>>
>>    
>>
>
>Sure, mine too. Between the many gigs of MP3s and movies I have stored
>on my HD, only about 10-20GB is the OS, Email, and documents/source
>code. Even just compressing that small portion though I could probably
>save between 5-10GB. The difference is though I can do a df before, and
>a df after, and I can instantly see I got my moneys worth. Same with
>encryption. 
>  
>
I am looking forward to the first user email complaining that he
compressed a file stored on reiser4 and it didn't save space (and then
someday maybe even an email saying that he compressed a file and it took
up more space but the user space compressor is sure that it saved space
and he does not understand....).:)

>With the repacker it is much more difficult (for average users) to time
>how long a program takes to load some file (or launch), before the
>repacker and after.
>
I think you are confusing repacking and compression?  Repacking, by
removing seeks, will make it more predictable not less.

> Especially since caching comes in to play. 
>
>Also, according to this little poll on one of the compressed FUSE sites
>you linked to, more people are looking to compression for space saving,
>then for speed:
>http://parallel.vub.ac.be/~johan/compFUSEd/index.php?option=polls&task=results&pollid=31
>
>
>  
>
>>No, mostly we're talking about things like office documents, the 
>>majority of which fit in less than a gigabyte, and multimedia (music, 
>>movies, games) which will gain very little from compression.  If 
>>anything, the benefit would be mostly in compressing software.
>>
>>    
>>
>>>less tangible like fragmentation percentages and minor I/O throughput
>>>improvements. I used to work at a large, world wide web hosting company
>>>and I could see making a case to management for purchasing Reiser4
>>>compression would be pretty easy for our shared servers. Instantly
>>>freeing up large amounts of disk space (where .html/.php files were the
>>>vast majority) would save huge amounts of money on disk drives,
>>>especially since most of the servers used RAID1 and adding new drives
>>>was a huge pain in the neck. Making a case to purchase a repacker would
>>>be much, much more difficult.
>>>      
>>>
>>Hmm, the problem is, if storage space is really the big deal, it's been 
>>done before, and some of these efforts are still usable and free:
>>
>>http://parallel.vub.ac.be/~johan/compFUSEd/
>>http://www.miio.net/fusecompress/
>>http://north.one.pl/~kazik/pub/LZOlayer/
>>http://apfs.humorgraficojr.com/apfs_ingles.html
>>
>>And while we're on the topic, here's an FS that does unpacking of 
>>archives, probably about the same way we imagined it in Reiser4 
>>pseudofiles/magic:
>>
>>http://www.nongnu.org/unpackfs/
>>
>>But regardless, as far as I can tell, the only real, tangible benefit of 
>>using Reiser4 compression instead of one of those four FUSE filesystems 
>>is speed.  Reiser4 would compress/decompress when actually hitting the 
>>disk, not just the FS, and it would also probably use in-kernel 
>>compression, rather than calling out to userspace on every FS operation.
>>    
>>
I think that compressing only on flush is a big issue.  It was a lot
harder to code it, but it really makes a difference.  You don't want a
machine with a working set that fits into RAM to be compressing, that
would be lethal to performance, and it is a very important case.

Hans
