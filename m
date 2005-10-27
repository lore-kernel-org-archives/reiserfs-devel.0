From: Hans Reiser <reiser@namesys.com>
Subject: Re: Our introduction to Reiser-list
Date: Thu, 27 Oct 2005 09:40:09 -0700
Message-ID: <436102E9.8040605@namesys.com>
References: <34286000544-BeMail@AlexDualP3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <34286000544-BeMail@AlexDualP3>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>John Gilmore wrote on Wed, 26 Oct 2005 17:02:06 +0000:
>  
>
>>I had understood that a big part of the issue with file-as-directory was the 
>>same as the issue with hard links to directories. Which I thought is that if 
>>you move one directory into another, you can lose the connection to the root 
>>of the filesystem -- I.E. ../../.. etc is no longer guaranteed to get you 
>>to / -- And of course this also means that there is no way to get from / to 
>>your freshly moved files, and you've just lost a chunk of disk space to 
>>complete inaccessibility. fsck would have to be made smarter specifically to 
>>be able to figure that one out, too.
>>    
>>
>
>The file move operation has to check that it doesn't break the graph into
>two graphs, thus disconnecting some files from the root.  Or you can think
>of it as being a way of deleting a whole subgraph of files all at once,
>kind of like an rmdir that works better than usual :-)
>
>Speaking of connecting to the root, one concept I found useful was to have
>a "True Path" to the root.  One of the hard links to a file / directory is
>considered to be the main one and the rest are auxiliary (easier done if
>each file/dir stores a list of parents).  The main one is guaranteed to
>lead to the root (a recursive property) and is used for ".." in directories
>and the equivalent operation for files.  Then when you want a canonical
>path, you build it by following the main parents up to the root.
>  
>
What do you do when unlinking the true path parent and there remain
links to the others, do you check for connection to root then during unlink?

>The "True Path" comes in useful for faking hard links for POSIX compatibility
>by misrepresenting them as symbolic links using the dynamically generated true
>path string.  As well, if you remove a hard link and it wasn't the main parent
>then you don't have to do any graph traversal to fix up things; all items
>will still have a valid link to the root through their unchanged main parent.
>
>- Alex
>
>
>  
>

