From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 16:10:48 -0400
Message-ID: <87irznelvb.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca> <200507060251.j662p7OC005227@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507060251.j662p7OC005227@laptop11.inf.utfsm.cl> (Horst von
 Brand's message of "Tue, 05 Jul 2005 22:51:07 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Chet Hosey <chosey@nauticom.net>, Kevin Bowen <kevin@ucsd.edu>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 05 Jul 2005 22:51:07 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:

> Hubert Chan <hubert@uhoreg.ca> wrote:
>> On Fri, 01 Jul 2005 03:41:00 -0400, Chet Hosey <chosey@nauticom.net>
>> said:
>> > Horst von Brand wrote:
>> >> And who says that a normal user isn't allowed to annotate each and
>> >> every file with its purpose or something else?

>> Explain how you currently allow users to annotate arbitrary files.

> By keeping annotations /outside/ the files.

So if I want to share annotations, I have to look in 20 different
places?

> [...]

>> The situation is even better with file-as-dir.  If the administrator
>> wants to allow users to edit the description metadata for the file
>> foo, the administrator can set the appropriate permissions for
>> foo/.../description, and keep foo read-only.

> So now root is responsible in exquisite detail for random other users
> being able to keep info about my files?

I can grant people permissions to write random info into my own files.
Or they can use unionfs if I don't grant them permissions.

Remember: the above argument was citing an advantage of file-as-dir over
packed files (storing metadata as a tar or zip file, similar to what
OpenOffice.org does, or even something like exif or id3).  In a packed
file, I can't allow people to edit the description attribute without
allowing them to edit the entire file.  With file-as-dir, I get much
finer grained permissions.

> [...]

>> Actually, you could use something like unionfs to allow users to keep
>> their own annotations without affecting everyone else's.

> Again, root has to mount that stuff for each and every user?

suid program that allows union mount into a directory within my own tree
(or just into any directory that I have write permissions should be
sufficiently secure).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

