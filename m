From: lrc1@st-andrews.ac.uk
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Sat,  6 Dec 2003 22:41:53 +0000
Message-ID: <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87zne7xltp.fsf@uhoreg.ca>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Quoth Hubert Chan <hubert@uhoreg.ca>:

...

> 
> [1] This presents another problem to hardlinking across partitions.
> What if you try to hardlink a file from a read-only partition onto a
> read-write partition (or vice versa)?  A hardlink is supposed to be
> essentially the same on both sides, so will you be able to write the to
> the file or not?  Whichever one you choose, something breaks.
> 

Yes, this is why I said earlier that hard linking across filesystems doesn't
fit with the standard Unix idea of mount points and mount subtrees. The
problem is the stipulation that the files on a volume must all form a single
hard-linked tree. Of course, for that to be the case every file on the volume
(except the root) must have at least one hard-parent which is also on the
volume. And since all the hard links to a file are indeed equal, no hard links
across volumes can be permitted (except to volume roots) lest a (non-root)
file be left with no hard-parents on the same volume and yet not be deleted.

(This is what makes it safe to assume that all of a directory's hard-children
are on the same volume as their parent (mount points aside), as you do above.)

The solution I suggest is to throw out the "one volume, one tree" requirement.
The volume's tree then becomes a forest, with every file with no parent in the
volume being the root of a tree. (Of course, if you also have multiple
hard links to directories, then the trees are instead directed, acyclic
graphs.) You could think of them all as being mount points, but in fact the
volume would have no fixed mount points at all.

Taking a step back, if all the filesystems on a system were so, then any file in
any location in the computer's global filesystem tree (or graph) could in
principle be on any of the computer's (sub)filesystems regardless of what
(sub)filesystem its parents were on. Thus the answer to your question above
would be that the file would be in ... whatever filesystem it happened to be in,
not necessarily that of /any/ of its parents.

stat()/lstat() could (still) be used to determine the filesystem of a given
file. To determine all the files on a given filesystem without (l)stat()ing
every file on the computer, some new means would be necessary. This could simply
be a new system call, but I would favour a kind of /proc-like setup, which would 
however require two different new types of link (weak non-symbolic links and 
links to directories which are to be interpreted as if they were links to 
non-directory files). Two-way linking between directories and their children and 
explicit deletion of files are also pretty much prerequisites for hard-linking 
across filesystems. More implementation problems and solutions on 
request.

...

Leo.


-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
