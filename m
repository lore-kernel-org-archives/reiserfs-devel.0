From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 00:06:33 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87y8phtxk6.fsf@uhoreg.ca>
References: <87hdw5vifk.fsf@uhoreg.ca> <200403310307.i2V37dxe008182@sirius.cs.pdx.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "The" == The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu> writes:

[...]

Elliott> One possibility would be to use a character shells tend to grab
Elliott> and are therefore extremely uncommon in filenames. The ones
Elliott> that come to mind are ! & and \, perhaps it is a matter of
Elliott> tweaking the EvilOS folks, but \ seems like a viable
Elliott> option. Failing that, I suspect & is also a reasonable option
Elliott> as well.

But if the shell grabs it, that makes it even more painful to access.
We might as well just use ..metas, which is very unlikely to conflict.
Also, those uncommon characters you mention (except probably \) won't
be that uncommon, especially with GUIs becoming a more common
file-management method, and Linux being more accessible to
non-techies.  Heck, even *I've* named some files with *spaces* in the
name!  And I've been capitalizing some filenames!

(\ is probably a reasonable suggestion, though.  But I still prefer
..metas.  For one thing, adding another delimiter may cause confusion --
more rules for a user to learn, and would probably involve VFS changes,
which I doubt would be accepted.  Plus, I think that having mixed
forward-slashes and back-slashes in a path name would look ugly.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

