From: lrc1@st-andrews.ac.uk
Subject: Re: Carrying Attributes too Far
Date: Sat,  6 Dec 2003 23:33:57 +0000
Message-ID: <1070753637.3fd267652753f@webmail.st-andrews.ac.uk>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD07C4D.6090401@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD07C4D.6090401@namesys.com>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Quoting Hans Reiser <reiser@namesys.com>:

> lrc1@st-andrews.ac.uk wrote:
> 
> >Quoting Hans Reiser <reiser@namesys.com>:
> >
> >...
> >
> >  
> >
> >>lrc1@st-andrews.ac.uk wrote:

[...]

> >>>
> >>>Quoting Hubert Chan <hubert@uhoreg.ca>:

[...]

> >I would suggest that for every link to a file on a different filesystem,
> the
> >linking directory should store both an identifier for the child file's
> >filesystem and the child file's on-disk inumber on that filesystem.* The
> reverse
> >links would be stored in the same way. 
> >
> I can accept a patch that does this.

(ulp) ... yessir. Two things though: first, it's going to be a while before I
have any patches for you. When I said I wasn't even a passable Unix geek I
wasn't being modest. But rest assured I am now working frantically on this. :)

Second, before implementing hard linking across directories you're really going
to need two-way links between directories and their children. * You'll also need
explicit file deletion and if possible weak non-symbolic links (..loose links).

* More precisely, you'll need the call to discover the parents of a given file.
The actual reference from child to parent is only absolutely necessary for links
across filesystems; on internal links it's basically a performance optimisation.

[...]

> >This leaves one significant problem: what happens when a file is moved from
> one
> >filesystem to another? What will prevent the cross-filesystem hard links to
> the
> >file from breaking? Cleaning up cross-filesystem links after explicit file
> >deletion is a related but simpler problem. I think a good but not ideal
> solution
> >to this problem is possible. I'll go into detail if anyone is interested.
> >  
> >
> More interested in patches....

In any case, hard links across filesystems alone is a solid 80% solution. You
probably want to implement it first before adding moving across directories.

[...]

Leo.

-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
