From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: 30 Nov 2004 08:54:10 +0000
Message-ID: <1101804850.17807.16.camel@pear.st-and.ac.uk>
References: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
	 <41ABA9D3.7020602@st-andrews.ac.uk>
	 <1101771315.1261.4.camel@zathras.emsl.pnl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101771315.1261.4.camel@zathras.emsl.pnl.gov>
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kevin Fox <Kevin.Fox@pnl.gov>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

On Mon, 2004-11-29 at 23:35, Kevin Fox wrote:
> Heh. So, you can have a filename that can contain XPath looking junk.
> Now, what happens when you have an XML file that points to another XML
> file using XPath? How do you separate the file name XPath from the XML
> XPath?

My suggestion was simply about unifying the namespace for selection in
the file system and selection within XML files using a syntax related to
(but not necessarily identical with) XPath.
 I was not suggesting you should do anything special with the content of
the XML files, even if the XML file contains an XPath reference.
(The latter could be interesting to think about as a separate issue
later, but it is certainly not part of my simpler suggestion.)
 Peter

