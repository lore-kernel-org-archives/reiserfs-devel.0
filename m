From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: file as a directory
Date: Mon, 29 Nov 2004 18:20:35 -0300
Message-ID: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
References: <christian.mayrhuber@gmx.net>
Return-path: <reiserfs-list-return-22623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Christian Mayrhuber <christian.mayrhuber@gmx.net> 
   of "Sat, 27 Nov 2004 14:14:18 BST." <200411271414.18801.christian.mayrhuber@gmx.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Christian Mayrhuber <christian.mayrhuber@gmx.net> said:
> On Saturday 27 November 2004 12:09, Peter Foldiak wrote:
> > On Fri, 2004-11-26 at 21:13, Christian Mayrhuber wrote:
> > > Regarding namespace unification + XPath:
> > > For files: cat /etc/passwd/[. = "joe"] should work like in XPath.
> > 
> > I don't understand this. Why would you need the "."? And why the /
> > between passwd and [ ?
> Yes, I was confused by /etc/passwd/[username] in an earlier email.
> I think we both mean basically the same.

Now think about files with other formats, for instance the (in)famous
sendmail.cf, or less structured stuff like you find in /etc/init.d/, or
just Postgres databases (with fun stuff like permissions on records and
fields)... or just people groping in /etc/passwd wanting to find the whole
entry (not just one field), or perhaps look at the 15th character of the
entry for John Doe.

This way lies utter madness (what format description should be applied to
what file this time around?). Plus shove all this garbage into the kernel?!
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
