From: lrc1@st-andrews.ac.uk
Subject: The danger of bad external links
Date: Sun,  7 Dec 2003 09:08:53 +0000
Message-ID: <1070788133.3fd2ee2545967@webmail.st-andrews.ac.uk>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de> <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca> <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk> <3FD27FF2.3000907@ninja.dynup.net> <878ylps6qq.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <878ylps6qq.fsf@uhoreg.ca>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Let me begin with a reading from scripture:

    The same non-directory file may appear in several directories under possibly
    different names. This feature is called linking; a directory entry for a
    file is sometimes called a link. The Unix system differs from other systems
    in which linking is permitted in that all links to a file have equal status.
    That is, a file does not exist within a particular directory; the directory
    entry for a file consists merely of its name and a pointer to the
    information actually describing the file. Thus a file exists independently
    of any directory entry, although in practice a file is made to disappear
    along with the last link to it.

    - The UNIX Time-Sharing System, D. M. Ritchie and K. Thompson
    http://cm.bell-labs.com/cm/cs/who/dmr/cacm.html

So Unix hard-links should indeed be thought of as references to a file rather
than as the file itself. No hard-link is any more or less just a pointer than
any other - but they /are/ all "just pointers".

Now, in the system I propose there are three things that threaten to create
broken or blocking hard-links:

1) A file is cleanly deleted

2) A filesystem is cleanly unmounted

3) Bad Stuff happens

1) As you know, unlink() does exactly what it says: it deletes the specified
link to a file. This deletes the file if and only if it then has no hard-links
left. Explicit file deletion does pretty much the reverse: a file's owner (or
root) can use it to delete a file, and it will then delete the one or more links
that would otherwise be left hanging. Of course, to do that it needs to find the
hard links to the file. A reference count won't tell us that, so instead we need
a means to find the hard-parent directories of a given file. (As it happens we
need that feature for some other useful things too, such as finding all the
pathnames of a given file.) The obvious way to do this is to maintain pointers 
back from each file to all its parent directories. (If the deleted file is a 
directory, this means that we will also have to clean up by deleting all the 
reverse links from its children.)

Once you have what you need to do explicit file deletion, it should be easy to
add weak non-symbolic links too. These are exactly like hard links except that
they don't keep a file from being deleted: if a file has only weak non-symbolic
links to it, it will be gced. unlink()ing the last hard link to a file with weak
non-symbolic links should be exactly the same as explicitly deleting it.

2) When a filesystem is unmounted, every external link to the files on it should 
normally be deleted. If we have the ability to do explicit file deletion, we 
should already have everything we need to do this. (Again, we also need to tidy 
up external reverse links to directories that are being removed.)

3) When either of the two filesystems involved in an external hard link screw up 
then the link may block or break, and there is no realistic way to prevent this. 
But then this is nothing new. Any filesystem which screws up can mangle internal 
hard links, corrupt file bodies, block all calls to it forever, or what have 
you. The important thing is that the damage can extend only to its own files and
their descendants, and external hard linking does not change this. (And if a
file on a well-behaved filesystem has one path to root which passes through a
misbehaving filesystem, and one which does not, only the path through the
misbehaver can be affected.) The /don't do that, then/ principle applies here:
if you don't trust a particular filesytem to store an important file, or to
record an important pathname, then don't put the file, or any of the directories
which record segments of the pathname, in that filesystem.

More later, and in my reply to David Masover.

Leo.

-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
