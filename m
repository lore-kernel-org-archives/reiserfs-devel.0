From: lrc1@st-andrews.ac.uk
Subject: Re: carrying links too far? (was Re: A bold idea (Re: Carrying Attributes too Far))
Date: Sun,  7 Dec 2003 13:18:33 +0000
Message-ID: <1070803113.3fd328a961d00@webmail.st-andrews.ac.uk>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca> <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk> <3FD27FF2.3000907@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD27FF2.3000907@ninja.dynup.net>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Quoting David Masover <jedi@ninja.dynup.net>:

[...]

> lrc1@st-andrews.ac.uk wrote:

[...]

> >
> The problem here is that if the link itself is on a different filesystem 
> than the actual data, and the original filesystem gets nuked, what do I 
> do about the link?  Traditionally, in order to delete a link, you drop 
> the refcount of whatever it points to.  Here, you'd be left with the 
> choice of either having a way to forceably remove a link, even if it 
> can't adjust the refcount, and have "lost chains" or orphaned files, or 
> you'd be left with certain links that you cannot remove without 
> reformatting that filesystem -- possibly in the process creating more 
> such links on other filesystems. 

If the child file's filesystem gets unmounted, then the external link to the 
child file should normally be deleted; it certainly shouldn't be left hanging. 
The child file won't just have a refcount; it will have pointers back to all of 
its external parent directories (and possibly its internal ones too). So there's 
no danger of external references being mistaken for ordinary internal ones. And 
the external reference information can be used to figure out where to reconnnect 
the filesystem when it is next remounted - exactly how is a longer story though.

> Or you could just not have the 
> refcounts (or, indirectly, the deletion of the file) have anything to do 
> with any hardlinks (maybe "firmlinks"?) on other partitions/filesystems, 
> but then the file goes away when all hardlinks are gone, leaving these 
> "firmlinks" broken.

'Firmlinks' is probably a bad word, since apparently the things are known as
weak references in garbagecollectionese.

> 
> I guess the main problem I have with this is that it only works when 
> we're talking about all the filesystems on the local machine, and then 
> only so far.  It kind of falls apart with removable filesystems like 
> floppies and cds.

There are several different ways you can handle filesystems which are
frequently mounted and remounted. Old single-tree filesystems can probably be
adapted or fooled into working reasonably well with external hard links too. (I
expect that making them work with multiple hard-links to directories would be
more difficult.)

[...]

Leo.

-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
