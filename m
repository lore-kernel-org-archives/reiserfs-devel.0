From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 22:51:07 -0400
Message-ID: <200507060251.j662p7OC005227@laptop11.inf.utfsm.cl>
References: <hubert@uhoreg.ca>
Return-path: <reiserfs-list-return-24988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hubert Chan <hubert@uhoreg.ca> 
   of "Tue, 05 Jul 2005 16:55:33 -0400." <87pstxynui.fsf@evinrude.uhoreg.ca> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Chet Hosey <chosey@nauticom.net>, Kevin Bowen <kevin@ucsd.edu>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hubert Chan <hubert@uhoreg.ca> wrote:
> On Fri, 01 Jul 2005 03:41:00 -0400, Chet Hosey <chosey@nauticom.net> said:
> > Horst von Brand wrote:
> >> And who says that a normal user isn't allowed to annotate each and
> >> every file with its purpose or something else?

> Explain how you currently allow users to annotate arbitrary files.

By keeping annotations /outside/ the files.

[...]

> The situation is even better with file-as-dir.  If the administrator
> wants to allow users to edit the description metadata for the file foo,
> the administrator can set the appropriate permissions for
> foo/.../description, and keep foo read-only.

So now root is responsible in exquisite detail for random other users being
able to keep info about my files?

[...]

> Actually, you could use something like unionfs to allow users to keep
> their own annotations without affecting everyone else's.

Again, root has to mount that stuff for each and every user?
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
