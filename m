From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: file as a directory
Date: Tue, 30 Nov 2004 13:31:29 -0300
Message-ID: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>
References: <Peter.Foldiak@st-andrews.ac.uk>
Return-path: <reiserfs-list-return-22636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> 
   of "30 Nov 2004 15:29:40 -0000." <1101828580.17826.165.camel@pear.st-and.ac.uk> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> said:
> On Tue, 2004-11-30 at 14:51, Horst von Brand wrote:
> > > I was suggesting this idea mainly form XML files, where the tags define 
> > > the parts clearly.

> > Use a XML parsing library then.

> But namespace unification is important,

Why? Directories are directories, files are files, file contents is file
contents. Mixing them up is a bad idea. Sure, you could build a filesystem
of sorts (perhaps more in the vein of persistent programming, or even data
base systems) where there simply is no distinction (because there are no
differences to show), but that is something different.

>                                         and to unify the namespace, you
> have to use the same syntax. I guess you disagree with me on that. (If
> not, how would you do it?)

I'd go one level up: Eliminate the distinctions that bother you, not try to
patch over them.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
