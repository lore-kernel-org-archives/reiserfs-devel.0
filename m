From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 11:42:42 -0400
Message-ID: <200509201542.j8KFgh2q011730@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-26128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Mon, 19 Sep 2005 23:28:10 MST." <432FABFA.9010406@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Hans Reiser <reiser@namesys.com> wrote:
> Nick Piggin wrote:
> > Hans Reiser wrote:
> >> So why is the code in the kernel so hard to read then?
> >>
> >> Linux kernel code is getting better, and Andrew Morton's code is
> >> especially good, but for the most part it's unnecessarily hard to
> >> read. Look at the elevator code for instance.  Ugh.

> > What's wrong with the elevator code?

> The name for one.  There is no elevator algorithm anywhere in it.

IO schedulers are commonly called "elevators", even though most of them
aren't. Standard operating system terminology.

>                                                                    There
> is a least block number first algorithm that was called an elevator, but
> it does not have the properties described by Ousterhout and sundry CS
> textbooks describing elevator algorithms.  The textbook algorithms are
> better than least block number first,

Funny that the "texbook algorithms" aren't used in real life. Wonder why...

>                                       and it is interesting how nobody
> fixed the mislabeling of the algorithm once Linux had gotten to the
> point that it was striving for more than making gcc be able to run on it. 

Could you /please/ stop your snide remarks on the code and its authors? If
for nothing else, the very people you are insulting in public are the exact
ones that will decide if they take on the work of auditing and integrating
your code.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
