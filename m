From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 11:45:03 -0400
Message-ID: <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl>
References: <tdwebste2@yahoo.com>
Return-path: <reiserfs-list-return-24555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Timothy Webster <tdwebste2@yahoo.com> 
   of "Fri, 24 Jun 2005 02:35:10 MST." <20050624093510.4330.qmail@web51301.mail.yahoo.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tdwebste2@yahoo.com
Cc: Lincoln Dale <ltd@cisco.com>, Hans Reiser <reiser@namesys.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Timothy Webster <tdwebste2@yahoo.com> wrote:

[...]

> I think it is the task of the linux community to
> generalize the vfs layer and not lock out reiserfs4
> until that is done.

No... the task of the Linux community is to make a better kernel.

You will have to do the work to convince it that the changes give a better
kernel if included. That means the work to find out what they object to,
solve the problem (if it can be solved), and try again.

>                     reiserfs4 wants to keep a plugin
> id for each and every file.

Good for you. Nobody else has shown any interest in that.

>                             An additional filesystem
> layer is the traditional solution to achieve advanced
> features, but not an optimal solution in my opinion.

Right. And what is said here is to /use/ said layer (VFS) or see how it can
be changed to cater for your needs.

> Yes gnome, kde and perhaps cifs do it.

Gnome and KDE are userspace utilities, designed to run on several operating
systems that do not have such filesystem plugins at all, plus for the
foreseable future the mayority of Linux (file)systems won't have them
either; so they probably won't ever use it for portability's sake. CIFS is
a second class citizen AFAIU, as it exists for compatibility with legacy
systems only. So none of the above is in any way compelling.

>                                        But if instead
> they used file plugins a lot more could be shared.

> Blush, I am not a file system expert

/me neither ;-)
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
