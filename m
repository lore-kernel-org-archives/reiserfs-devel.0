From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 17:07:00 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87zn4bkoej.fsf@uhoreg.ca>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Linus" == Linus Torvalds <torvalds@osdl.org> writes:

[...]

Linus> I've seen all these examples of exposing MP3 ID information as a
Linus> "side stream", and that's TOTALLY POINTLESS! The information is
Linus> already there, it's in a standard format, and exporting it as a
Linus> stream buys you absolutely nothing.

Exporting it through the filesystem would mean that I could use my
favourite editor to edit MP3/OGG tags, instead of having to use some
other program that has a piece-of-crap interface.  It's a
user-interface issue, and not a technical issue.

Someone might then tell me to write my own MP3-tag editor that has an
interface that I like.  How may MP3 tag editors do we need?  Besides, I
have better things to do with my time.

Actually, I would argue that things like ID3 tags for MP3 files, and
EXIF for JPEG exist only because filesystems in general can't support
associating metadata/attributes with files.  If filesystems were built
the "right way" to begin with, all those tagging schemes would never
have come into existence.  Of course, that's just a dream, but one can
dream, can't they?

[...]

Linus> And realize that the "separate shadow tree" actually works very
Linus> well.  That's how version control systems like CVS have always
Linus> worked.

VMS (or some other OS -- too lazy to look it up) exposed version control
through the filesystem.  Their naming sucked (or so says Pike), but
that's what they did.

Yes, CVS works, but I wouldn't say that it works very well.  If I want
to get a specific version of a file, I need to drop to the command line
and type in some cvs command that I don't remember and then open the
file.  I can't just do "C-x C-f foo.c/version/2.1" in emacs.

Yes, emacs has version-control support, so that I can open up a
specific version.  But if v-c isn't exposed through the filesystem, we
would have to add support to emacs for every v-c system out there.  And
do the same for vi, gedit, nano, bluefish, conglomerate, Mozilla
Composer, glade, etc.

Linus> It's certainly how you can make icon information work too. If you
Linus> use a tool for accessing the data, the tool can maintain
Linus> coherency and you'll never care about the side stream.

The point is that I shouldn't need to use a special tool.  I should be
able to use my favourite text/image/sound/etc. editor.

Using a special tool may work for you, but it isn't the optimal user
interface in general.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

