From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 14:51:01 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87eklnm99m.fsf@uhoreg.ca>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21168-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

>>>>> "V13" == V13  <v13@priest.com> writes:

V13> Maybe I'm crazy but:

V13>  You're talking about a major change in the way filesystems work if
V13> this is going to be used by other FSs too. If I understand this
V13> correctly it is a completely new thing and trying to do it by
V13> patching existing well-known 'primitives' may be wrong.

V13>   AFAIK and AFAICS the metadata are not files or directories. You
V13> can look at them as files/dirs but they are not, just like a tar is
V13> not a directory. I believe that the correct thing to do (tm) is to
V13> add a new 'concept' named 'metadata' (which already exists). ...

And you'll need a new 'concept' named 'streams'.  And a new concept for
every extension you want/need to add to the filesystem.  By exposing
everything through the normal filesystem interface, you don't need to
make any modifications to your programs to use the new concepts.
Everything just works as expected.  (With the possible exception of
backup-like software, but it is easier to fix just the backup software
than every other program that's out there.)

The hypothetical object /usr/bin/xterm/icon.png looks like a file,
smells like a file, and quacks like a file.  Why shouldn't it be a file?

V13> This way you'll have files, directories and metadata (or whatever
V13> you call them). So, each directory can have metadatas and files and
V13> each file can have metadatas. Then you have to provide some new
V13> methods of accessing them and not to use chdir() etc. (lets say
V13> chdir_meta() to enter the meta dir which will work for files
V13> too). After entering the 'metadir' you'll be able to use existing
V13> methods etc to access its 'files'.

V13>   This approach doesn't mess with existing things and can be
V13> extended for other filesystems too.

Either way, filesystems that want to implement that interface will need
to be changed.  The question is just what kind of interface we will
expose to the users/programs.  And since that's what the question is,
it seems to me that we want to expose it through an interface that the
users are already used to.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

