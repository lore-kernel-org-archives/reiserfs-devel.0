From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: "Metas"
Date: 18 Apr 2004 01:28:16 -0400
Message-ID: <c5t3lg$g9g$1@satsuki.furryterror.org>
References: <408045B8.7000102@mrs.umn.edu> <20040418033328.24278.qmail@web25006.mail.ukl.yahoo.com>
Return-path: <reiserfs-list-return-18029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Jumping into a thread already in progress ;-)

Just for the record, if "..." is used for filesystem metadata, I
_will_ have to modify some software.  This modification will take
about 10 seconds to do (far less time than a Reiser4 conversion), but
it will have to be done nonetheless.  I used "..." because (at the
time) nobody else did.  :-P

In article <20040418033328.24278.qmail@web25006.mail.ukl.yahoo.com>,
Narcoleptic Electron  <narcoleptic_electron@yahoo.co.uk> wrote:
>David Masover wrote:
>
>- LESS LIKELY TO BE REJECTED BY LINUS.  

If you look through the archives you can see Linux responding to CVS
weenies who complained when Linus created directories named "core".
Apparently people who use CVS simply do not name their directories "core".

>- NAME CLASHES WOULD BE A USABILITY DISASTER. 

The more complicated the filename syntax and semantics, the more errors
might occur in user-space.  One of the nice things about most Unix
filesystems is that any conceivable null-terminated string is a valid
path through a DAG to an object of predictable type, subject to a few
length constraints.  Given a string, a user-space program can analyze
the string and infer filesystem structure from it, and the worst-case
difference between the user-space analysis and the kernel-space analysis
is that the string is not usable in the kernel because it is too long.

To understand why this is so nice, consider what happens on operating
systems where this is not true.  On Windows, a string with a particular
syntax is a valid path to a file or directory object...most of the
time.  If the last component of the string has a magic value, it may be
used as a key in a lookup table to a fatally different kind of object.
Windows filesystems have a veritable minefield of inconsistent, illegal,
or just plain surprising magic names.  Windows web servers used to have
all kinds of security problems (mostly DoS attacks) if the bad guys ask
the server for a URL with "con" or "com1" or "prn" or "lpt1" in the name.

A Unix server process needs only to know about symlinks, directories,
files, and "everything else" to be able to make useful access decisions.
The only significant character in a filename is the "/" and the only magic
file names are "." and "..", and the only exception to those two rules is
when the first character in the name is a "/".  All path searches end in
one of two things: an error, or an object with a particular file type.
The same server running on a filesystem that introduces a new special
file type (with a magic name no less) will have to be modified to control
access to the stuff with magic names.  If the server creates files then
it also has to control people who might create files with the magic
names too.

So a good question to ask is "What would happen if I ran Apache or an
FTP server with an incoming directory on top of this thing?" and if
the answer contains the phrase "you should put a few extra lines in
{access,srm}.conf to avoid having people surfing your metadata," then
you have a name clash.

Another thing to consider is that the namespace "names that begin with dot
and refer to metadata about nearby files" is very crowded by now.  If you
want to have some hidden files in a subdirectory that contained metadata,
you (and 50 other people) would logically consider the name ".meta".
I have seen a web server's example config files and a proprietary
cross-platform network file server which both used the name ".meta".

Perhaps the name should include the name of the filesystem which is
implementing the semantics, like ".reiser4meta"?  Presumably in the
fullness of time one might have to worry about versioning the metadata
too.  If the metadata is intended to be used across all Linux filesystems,
it would be called ".linuxmeta".

Or maybe...hmmm...

> $ echo $(tr -dc a-zA-Z0-9 < /dev/urandom | head -c6)
> 0fpjBC

A good name might be ".0fpjBC", which I'm pretty sure nobody has used
before.

>- DEFAULTS MATTER!  In addition to the functionality
>problems caused by a poor name choice (see previous
>point), users will complain about it in review
>articles, etc., before realizing (if ever) that it can
>be changed.  This will be a black mark on Reiser4.

I would suggest disabling the feature entirely until userspace supplies a
parameter with no default for the name.  The 'mount' command or whatever
program writes the option field in /etc/fstab might later be extended with
a default if there is widespread agreement on one.

Then again, maybe I'm too darn reactionary to like the idea at all.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
