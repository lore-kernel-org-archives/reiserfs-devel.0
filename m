From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: file as a directory
Date: Fri, 17 Dec 2004 22:52:09 -0300
Message-ID: <200412180152.iBI1q98X007507@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-22836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Fri, 17 Dec 2004 08:52:44 -0800." <41C30EDC.5030502@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Nate Diller <ndiller@namesys.com>

Hans Reiser <reiser@namesys.com> said:
> David Masover wrote:
> > Hans Reiser wrote:
> > [...]
> > | My solution is to tell Nate Diller that there is extensive literature on
> > | it, that it isn't really the big problem it is made out to be, and leave
> > | it to him to go read the literature and code it up after he finishes the
> > | required tasks of our current darpa contract.;-)

> > Can you point me to any such literature?  I'm just curious.

> Look in every field of cs except filesystems and kernels.;-)

Right. Smart people are found elsewhere only.

>                                                              Databases, 
> garbage collectors, etc.

Everthing stuff that works on the assumption that what they are working on
fits in RAM (or can overflow into swap space in a pinch), and that RAM is
fast (and even so they are infuriatingly slow). And disks are usually a few
thousand times larger than RAM (more stuff to shuffle around) and a million
times slower...

>                          Specific reference, no, I didn't collect them, 
> sorry, but alexander the befs driver guy knows more than I about this.

Furious handwaving doesn't make it true.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
