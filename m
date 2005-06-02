From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - VFS Changes
Date: Thu, 02 Jun 2005 00:46:50 -0700
Message-ID: <429EB96A.8040500@namesys.com>
References: <50752605829-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <50752605829-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: jbriggs@esoft.com, Valdis.Kletnieks@vt.edu, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, nikita@clusterfs.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Tue, 31 May 2005 11:32:04 -0700:
>  
>
>>What about if we have it that only the first name a directory is created
>>with counts towards its reference count, and that if the directory is
>>moved if it is moved from its first name, the new name becomes the one
>>that counts towards the reference count?   A bit of a hack, but would work.
>>    
>>
>
>Sounds a lot like what I did earlier.  Files got really deleted when the
>true name was the only name for a file (only one parent in other words).
>But I also had a large cycle finding pause when any file movement happened.
>I'm not sure if it would still be needed.
>
>Nikita Danilov wrote:
>  
>
>>- if garbage collection is implemented through the reference counting
>>(which is the only known way tractable for a file system), then cycles
>>are never collected.
>>[...]
>>But the garbage collection problem is still there. You are more than
>>welcome to solve it by implementing generation mark-and-sweep GC on file
>>system scale. :-)
>>    
>>
>
>There are at least two choices:
>
>Bite the bullet and have a file system that is occasionally slow due to
>cycle checking, but only when the user somehow makes a huge cycle.  Keep
>in mind that this only happens when you use the new functionality, if you
>only create files with one parent, it should be as fast as regular file
>systems.  I see its features being useful for desktop use, not servers,
>so the occasional speed hit is less annoyance than the lack of features
>(the ability to file your files in several places).
>  
>
I prefer the above to the below.

>Another way is to not delete the files when they get unlinked.  Similar
>to some other allocation management systems, have a background thread
>doing the garbage collection and cycle tracing.  The drawback is that
>you might run out of disc space if you're creating files faster than
>the collector is cleaning up.
>
>I wonder if you can combine a wandering journal (or whatever it is called,
>where the journalled data blocks become the file's current contents) with
>the copy type garbage collection (is that the same as a 2 generation mark
>and sweep?).  Copy type collection copies all known reachable objects to
>an empty half of the disk.  When that's done, the original half is marked
>empty and the next pass copies in the other direction.  Could work nicely
>if you have two disk drives.  Yet another PhD topic on garbage collection
>for someone to research :-)
>
>There are lots of other garbage collection schemes that might be
>applicable to file systems with cycles.  It could work, maybe with
>decent speed too!
>
>- Alex
>
>
>  
>

