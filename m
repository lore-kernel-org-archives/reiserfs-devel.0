From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: file as a directory
Date: Tue, 21 Dec 2004 13:29:46 -0300
Message-ID: <200412211629.iBLGTljB008731@laptop11.inf.utfsm.cl>
References: <agmsmith@rogers.com>
Return-path: <reiserfs-list-return-22874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from "Alexander G. M. Smith" <agmsmith@rogers.com> 
   of "Mon, 20 Dec 2004 22:40:10 EDT." <2738999945-BeMail@cr593174-a> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

"Alexander G. M. Smith" <agmsmith@rogers.com> said:
> Hans Reiser wrote on Mon, 20 Dec 2004 09:21:35 -0800:
> > Ok, go talk to the befs driver guy, and you'll find out he has already 
> > done work on it.

> I just did some work in making a test file system with hard links and
> bidirectional references (files know which directories (plural) they are in).
> It uses a simple graph traversal upon delete to do garbage collection.
> Compared to the sophisticated garbage collection algorithms I was reading
> about at university a decade ago, it's nothing worth writing a paper about!
> But still, there was enough new stuff to make it worth writing a text file:
> http://web.ncf.ca/au829/BeOS/AGMSLinkExplanation.txt

I.e., Stop the world while we traverse the whole thing to find out what (if
something) can be deleted now? An inode has a _huge_ size (or has a list of
parents hanging off it)?

> And if you want, you can read the excessively commented source code,
> including a large passage explaining the delete/rename algorithm, at:
> http://web.ncf.ca/au829/BeOS/AGMSRAMFileSystem20040403.zip

> Horst wrote:
> >> Everthing stuff that works on the assumption that what they are working
> >> on fits in RAM (or can overflow into swap space in a pinch), [...]

> Admittedly my experiment was for a RAM disk.  It can be extended to a real
> disk if the number of inodes in a graph traversal can fit into memory (or
> otherwise can somehow be locked).

Can't guarantee they fit into RAM; can't lock everything down in a _huge_
disk being used by lots of processes (the system would grind to a halt).

>                                     If that doesn't work, then the user
> would have to delete individual files before removing a directory cycle.

How does the user know that this is a directory cycle being removed? Also,
while I nuke a particular link into the cycle, somebody else could be
creating a new one...

Nice prototype. Can we now go back to real filesystems?
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
