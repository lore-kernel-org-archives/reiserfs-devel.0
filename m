From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: FS: hardlinks on directories
Date: Sun, 24 Aug 2003 15:15:19 -0400 EDT
Message-ID: <6563395606-BeMail@cr593174-a>
References: <3F48F77D.7040907@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15404-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F48F77D.7040907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hans Reiser wrote on Sun, 24 Aug 2003 21:35:57 +0400:
>Helge Hafting wrote:
>>On Tue, Aug 05, 2003 at 03:03:51PM +0200, Stephan von Krawczynski wrote:
>>>On Tue, 05 Aug 2003 14:51:46 +0200 Helge Hafting <helgehaf@aitel.hist.no> wrote:
>>>>Even more fun is when you have a directory loop like this:
>>>>
>>>>mkdir A
>>>>cd A
>>>>mkdir B
>>>>cd B
>>>>make hard link C back to A
>>>>
>>>>cd ../..
>>>>rmdir A
>>>>
>>>>You now removed A from your home directory, but the
>>>>directory itself did not disappear because it had
>>>>another hard link from C in B.
>>>>      
>>>>
>>>How about a truly simple idea: 
>>>
>>>rmdir A says "directory in use" and is rejected
>>>
>>>    
>>>
>>Then anybody can prevent you from removing your obsolete directories
>>by creating links to them.  Existing hard link don't have
>>such problems.
>>  
>>
> So, he needs links that count as references, links that don't count as 
> references but disappear if the object disappears (without dangling like 
> symlinks), and unlinkall(), which removes an object and all of its 
> links.  He needs for the first reference to a directory to be removable 
> only by removing all links to the object, or designating another link to 
> be the "first" reference.
> 
> Sounds clean to me.  This is not to say that I am funded to write 
> it.;-)  I'd look at a patch though.....;-)
> 
> I need to write up a taxonomy of links..... after reiser4 ships.....

I handled it differently in my RAM file system.  It supports hard links
to directories, and to anything else too.  It does a full graph traversal
to find the affected things when you try to delete a directory.  If the
deleted directory doesn't isolate anything, it just gets deleted.  Yes,
there is a "first" reference to the main ".." parent directory, which
gets changed to some other directory if the parent connection is
deleted.  If some parts of the file system name space get isolated
(other than the directory you are deleting), it doesn't allow the
operation and returns an error.  I considered letting it automatically
delete the isolated parts (actually trivial to implement), but thought
that users might get annoyed when, for example, "rmdir /etc" would
actually erase /etc and all its contents.

Under the hood, there are a few changes to make it possible.  One is
that all things have a list of their parent directories (and parent
hard links), not just an nLink counter.  This definitely isn't your
grandfather's Unix :-).  Another side effect is that file system
objects have a canonical path and True Names.  See
http://members.rogers.com/agmsbeos/AGMSLinkExplanation.txt
if you want the details on the design decisions.

- Alex
