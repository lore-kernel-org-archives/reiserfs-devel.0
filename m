From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Carrying Attributes too Far
Date: Wed, 24 Sep 2003 15:37:38 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87wubynfjx.fsf@labatt.uhoreg.ca>
References: <1971720372-BeMail@cr593174-a> <1064280061.3f6f9ffd2c514@webmail.st-andrews.ac.uk>
 <3F71655B.4060704@namesys.com>
 <1064425945.3f71d9d905106@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Leo" == lrc1  <lrc1@st-andrews.ac.uk> writes:

[...]

>> Why?  Not at all, I would say.

Leo> Short answer: because otherwise you have ""attributes" that cannot
Leo> interact with files in all the same ways that files can interact
Leo> with files" ( http://www.namesys.com/v4/v4.html ).

Hard linking isn't a universal attribute, though.  For example, you
cannot hard link over different filesystems.  If an attribute (such as
uid, premissions, etc.) are implemented by just taking the file's
standard stat data and exposing it as a file interface, that it is
similar to that data being from a different filesystem, and so you
can't hardlink.  This would be similar, I suppose, to if a plugin
exposes an MP3's id3 data as files -- it would make no sense to be able
to hardlink that, since the data is stored in the MP3 file, and not as
part of the filesystem.

As for your question about security -- changing file owners and such --
I assume that the filesystem would be able to reject file changes, if
it violated security policy.  I'm not a filesystem programmer, so I
don't know exactly how that would be implemented, but in one of Hans'
papers (probably the Reiser4 paper), where it talks about a plugin for
translating the new /etc/passwd interface into a flat file interface,
it mentions that the filesystem would be able to reject changes if,
e.g. the new version doesn't parse correctly.  So I assume file
ownership would be handled similarly.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

