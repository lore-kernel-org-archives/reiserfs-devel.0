From: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: late delete improving undeleting files on reiser4
Date: Tue, 25 Oct 2005 13:42:42 +0200
Message-ID: <435E1A32.7060001@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi!

The discussion abot loosing important files made me think about a
fetaure I met and liked on DR-DOS (later Novell DOS but I'm not sure if
they kept this feature) which may be nice in Reiser4 and would probably
need an additional plugin.

I'll call it "late delete" as I can't remember how they called it on
DR-DOS. As I'm not aware of all current features of Reiser4 (not using
it yet) please excuse me if this is already implemented or planned
somewhere.

So when deleting files, instead of directly removing the entries off the
directories and freeing the used blocks, they could be only "marked" for
deletion so undeleting would be easy. That's trivial so far. But the
nice (and tricky) feature would be this to be transparent in means that
when disk space gets used up such marked files would be actually deleted
and the user wouldn't notice a thing (except eventually some overhead
(badly implemented on DR-DOS) but to that later).

As simple as it may sound here it needs much more thinking how to do it
good. Here some things that come to my mind about it:

Disadvantages:
- overhead when disk space has to be reclaimed (late delete)
- increasing fragmentation as "mark-deleted" file space increases
effective disk usage %
- security issues when having bad defaults and/or is poorly configurable
- may need special undelete tool

Advantages:
- undeletes files fast, reliable and easy on mounted fs
- "mark-delete" is fast (see first disadvantage, so it's maybe only
using the needed time later)
- it is transparent up to the point of configuration and actual undelete
- improving media life on medias with limited write cycles (Flash Cards,
...) as data writes would cycle through all of the free space of the media

Improvements:
- having an attribute defining which file is to be "mark-deleted" and
which regularly deleted
- having a directory attribute for this feature in addition of
per-file-attribute as a default for new files
- defining a reclaim-strategy as "delete biggest/smallest files first",
"delete oldest mark-deleted file first" etc.
- having a "keep age" attribute to automatically delete "mark-deleted"
files after some time
- having a "deleted copies" attribute to define/limit how many copies of
the same deleted file has to be kept
- defining a max. fillup percentage for startig to reclaim space. By
this the overhead of reclaiming may be moved to a moment of low disk
usage (except when there is no space left) and the first disadvantage
would be mostly gone.
- tool to manually "purge/clean" some "mark-deleted" files (specific
ones or in a directory/tree)

Other improvements in connection with other plugins:
- compressing "mark-deleted" files
- having a "wipe file" attribute for security which wipes the data
portion of the deleted file (with zeroes, random, ...) before freeing
the blocks (evtl. in combination with the "keep age" attribute above)

As for the implementation the "mark-deleted" files/directories may be
moved to a (hidden) .deleted directory on the fs-root. Dependant on
implementation this may eventually loose the original location of the
file and could disclose otherwise protected files but would reduce the
overhead of the "delete oldest mark-deleted file first" strategy. Of
course having this directory as a kind of metadata listing of the files
and keeping them where they are would do the same but needs more coding.

So far my thoughts. Comments welcome.
--=20
Konstantin M=FCnning
