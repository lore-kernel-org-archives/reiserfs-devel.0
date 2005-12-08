From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Two usage examples for attribute directories.
Date: Thu, 08 Dec 2005 15:40:34 -0500
Message-ID: <87hd9jqq4d.fsf@evinrude.uhoreg.ca>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca>
	<43917967.4080008@st-andrews.ac.uk> <200512042027.16525.pvh@uvic.ca>
	<43983F5E.3080704@st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43983F5E.3080704@st-andrews.ac.uk> (Peter Foldiak's message of
	"Thu, 08 Dec 2005 14:12:46 +0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 08 Dec 2005 14:12:46 +0000, Peter Foldiak said:

[...]

> You say "author" should be an attribute but "icon.png" is not an 
> attribute. I am not convinced they should be treated differently.  The
> listing doesn't look ugly to me at all (just because it is long).

IMHO, putting attributes in foo/ instead of foo/@/ increases the risk of
collisions.  e.g. let's say I have a directory that contains a file
named icon.png, but I want my file manager to display its icon as some
other file.  If all the attributes are in foo/, then the file manager
will read foo/icon.png as the directory's icon, which is not what I
want.  It would be better if I could have a directory that contains
icon.png, and uses foo/@/icon.png as its icon in the file manager.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

