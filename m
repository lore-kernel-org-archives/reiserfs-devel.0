From: Kevin Fox <Kevin.Fox@pnl.gov>
Subject: Re: file as a directory
Date: Tue, 30 Nov 2004 08:28:23 -0800
Message-ID: <1101832103.2885.4.camel@zathras.emsl.pnl.gov>
References: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
 <41ABA9D3.7020602@st-andrews.ac.uk>
 <1101771315.1261.4.camel@zathras.emsl.pnl.gov>
 <1101804850.17807.16.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22635-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1101804850.17807.16.camel@pear.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

On Tue, 2004-11-30 at 08:54 +0000, Peter Foldiak wrote:
> On Mon, 2004-11-29 at 23:35, Kevin Fox wrote:
> > Heh. So, you can have a filename that can contain XPath looking junk.
> > Now, what happens when you have an XML file that points to another XML
> > file using XPath? How do you separate the file name XPath from the XML
> > XPath?
> 
> My suggestion was simply about unifying the namespace for selection in
> the file system and selection within XML files using a syntax related to
> (but not necessarily identical with) XPath.

So long as its different enough that you can have current XPath
implementations be able to separate the XPath from the filename, it
should be fine.

Really simple example,
file#foo

Is #foo handled by XPath, or passed to the file system?

>  I was not suggesting you should do anything special with the content of
> the XML files, even if the XML file contains an XPath reference.
> (The latter could be interesting to think about as a separate issue
> later, but it is certainly not part of my simpler suggestion.)
>  Peter
> 

What I was suggesting is that if your not careful, it may not be
possible for current libraries to know the difference between its XPath
like stuff and whatever is done in the file system.

Kevin
