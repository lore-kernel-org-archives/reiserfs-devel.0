From: Hans Reiser <reiser@namesys.com>
Subject: Re: Storing additional Information to a file (eg. ACLs) -> a solution?
Date: Tue, 03 Feb 2004 14:40:33 -0800
Message-ID: <40202361.9080609@namesys.com>
References: <1075756127.2350.29.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1075756127.2350.29.camel@schlappix.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Heinz-Josef Claes wrote:

>Hi,
>
>I just read the article from the first side of namesys.com. I have an
>idea about how to generally store security related attributes in a fast
>way which uses only a minimum of storage.
>
>First of all, I have absolutely now idea about filesystem layout; so
>don't hesitate to blame me that it's nonsense what I'm writing here, but
>perhaps it's not ...
>
>
>assumptions for my suggestion to make sense:
>1. securtity related attributes for files can be stored in (small)
>files.
>2. lots of files will probably have the same security related attributes
>3. you don't want to store security related attributes in lots of little
>files (eg. bad perforance)
>4. it's fast to calc an md5sum (or something similar) for a short series
>of bytes (a short file)
>
>
>the solution:
>1. take the first security related attribute and store it in a special
>(hidden) directory. The name of the file is the md5sum of it. The file
>which "points" to these permissions stores the md5sum or some kind of
>sequence number (which can be smaller the the 16 byte of the md5sum) of
>that little security related attribute file (sraf). This sraf counts the
>number of "links" to it by the normal link counter of the filesystem.
>2. take the second security related attribute and calc the md5sum. If
>it's new, do the same as described in 1. If it's same the md5sum of an
>existing sraf, make a "link" to it.
>3. If you delete a file, decrease the "link" count in the sraf. If the
>link count is zero, delete the sraf.
>
>
>This should be easy to implement, space efficient, fast and very
>flexible. (Reiserfs has no problems with lots of files in one
>directory.) You only have to think about what to do if the link count of
>an sraf is exceeded. This should be solvable in an easy way. I do not
>make any suggestion about this because I do not know anything about the
>internals of reiserfs (my solution would be stupid).
>
>
>Regards,
>and apologize my bad english
>
>Heinz-Josef Claes
>
>PS: This is basically the same idea as in storebackup ;-)
>
>  
>
Interesting.  Essentially, it is a form of compression.  If the unique 
values all easily fit into ram, it is a good thing.

