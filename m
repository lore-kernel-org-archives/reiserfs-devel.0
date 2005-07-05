From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 16:55:33 -0400
Message-ID: <87pstxynui.fsf@evinrude.uhoreg.ca>
References: <200507010328.j613SV3h004647@laptop11.inf.utfsm.cl>
	<42C4F38C.9020000@nauticom.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C4F38C.9020000@nauticom.net> (Chet Hosey's message of "Fri,
 01 Jul 2005 03:41:00 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chet Hosey <chosey@nauticom.net>
Cc: Kevin Bowen <kevin@ucsd.edu>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 01 Jul 2005 03:41:00 -0400, Chet Hosey <chosey@nauticom.net> said:

> Horst von Brand wrote:
>> And who says that a normal user isn't allowed to annotate each and
>> every file with its purpose or something else?

Explain how you currently allow users to annotate arbitrary files.

>> I can very well imagine a system in which users (say students in a
>> Linux class) want to do so... on a shared machine. Or users having a
>> shared MP3 or photograph or ... collection, with individual notes on
>> each. Or even developers wanting to annotate source code files with
>> their comments, but leave them read-only (or have them under SCM).

> This same argument could be used to attack the idea of group
> permissions -- that groups of users might have conflicting
> goals. Implementing metadata in userspace via bundled files has the
> same drawback.

The situation is even better with file-as-dir.  If the administrator
wants to allow users to edit the description metadata for the file foo,
the administrator can set the appropriate permissions for
foo/.../description, and keep foo read-only.

>>Kevin Bowen <kevin@ucsd.edu> wrote:
>>> If you're sysadmining a multiuser reiser4 box, and your users are
>>> able to modify the metadata of files they don't own, then you go to
>>> sysadmin purgatory.

Actually, you could use something like unionfs to allow users to keep
their own annotations without affecting everyone else's.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

