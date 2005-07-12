From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Mon, 11 Jul 2005 22:33:24 -0400
Message-ID: <200507120233.j6C2XODw030361@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-25098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Mon, 11 Jul 2005 15:58:11 MST." <42D2F983.1060105@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Stefan Smietanowski <stesmi@stesmi.com>, David Masover <ninja@slaphack.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

Hans Reiser <reiser@namesys.com> wrote:
> Stefan Smietanowski wrote:
> > I think "..." and ".meta" both serve as a logical delimiter. However
> > some programs implement their own "..." which would make it clash with
> > them. Naturally if some program created a directory called .meta we're
> > equally screwed.

> I chose '....' (four dots) because it clashes with less, not three dots.

Is this some kind of "My dots are more than yours" contest?!

/None/ of them is safe. ".meta", "...", "....", ".this.has.five.dots." are
all perfectly legal file (or directory) names, POSIXly. If any one of them
won't do, none will.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
