From: Viktors Rotanovs <viktors@rotanovs.com>
Subject: Re: filesystem <-> database
Date: Tue, 13 Jan 2004 16:37:04 +0200
Message-ID: <40040290.30904@rotanovs.com>
References: <400312B2.9040301@rotanovs.com> <16387.50506.681533.326732@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16387.50506.681533.326732@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote:

>Viktors Rotanovs writes:
> > I recently converted filesystem (reiser3.6) containing lots of small 
> > files (400000 files, about 10 bytes each, Cyrus IMAP quota files) to CDB 
> > database format (http://cr.yp.to/cdb.html plus some patching to make it 
> > read-write), thus gaining significant performance improvement (load avg 
> > was 5, became 3).
> > What is the best way to do the same for other similar small files, using 
> > Reiser4? As far as I can understand, I could:
> > 1) just put everything on Reiser4, with no changes
> > 2) write some plugin for Reiser4
>
>Can you explain what are you planning to use file system for in more
>details? What kind of operations and access patterns is expected?
>  
>
There will be three types of files, one file of each type for each of 
400000 users.
1st type: quotas (if I go away from CDB), not more than 20 bytes each.
typical quota operations: read whole file, then write it back.
sometimes it may be required to list them, but this operation is not 
performance-sensitive.
2nd type: sieve scripts, about 200-300 bytes each, some of them may be 
larger, but not more than 10kb (or maybe
there will be lower limit if that makes sense).
typical sieve operations: read whole file, and very rarely - write it 
back. For 400000 users that means that there may be 1 write in a minute, 
but read operation is required for every incoming mail message.
3rd type: "seen" files, they range from 0 to 10kb, and some of them may 
be even larger. They are accessed less often than first two types, but 
when they're accessed, they are usually read and written several times 
within 2-3 minute timeframe. I'm not sure at the moment, but it's 
possible that they're mmapped.
All files are currently organized into two levels of directories, 
something like this:
/var/imap/sieve/u/X/user.username
where "u" is first letter of username and "X" is a simple hash taken 
from the rest of username.
It's also possible to put all users in the same directory or use only 
one level of splitting, if that's necessary.
Directory list operations are *very* rare and occur only when performing 
system maintenance.
Permissions are the same for all files. Access times are not recorded 
(noatime,nodiratime). Last modification times are not important, too.

> > Is it possible to reduce file size on disk by not saving file ownership, 
> > modification time, etc.?
> > How much kernel's VFS interface, switching to kernel and back, directory 
> > caching, etc. does slow down these operations?
> 
>Nikita.
>  
>


