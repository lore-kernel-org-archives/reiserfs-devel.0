From: Christer Weinigel <christer@weinigel.se>
Subject: Re: The argument for fs assistance in handling archives
Date: 02 Sep 2004 20:38:19 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <m3llfsikis.fsf@zoo.weinigel.se>
References: <20040826150202.GE5733@mail.shareable.org>
	<200408282314.i7SNErYv003270@localhost.localdomain>
	<20040901200806.GC31934@mail.shareable.org>
	<Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	<20040902002431.GN31934@mail.shareable.org>
	<413694E6.7010606@slaphack.com>
	<Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
	<4136A14E.9010303@slaphack.com>
	<Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org>
	<4136C876.5010806@namesys.com>
	<Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
	<4136E0B6.4000705@namesys.com> <14260000.1094149320@flay>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <14260000.1094149320@flay>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin J. Bligh" <mbligh@aracnet.com>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

"Martin J. Bligh" <mbligh@aracnet.com> writes:

> > For 30 years nothing much has happened in Unix filesystem semantics 
> > because of sheer cowardice 
> 
> Or because it works fine, and isn't broken.

I've heard the same argument a lot of times.  People complaining that
Unix is so seventies because it sticks to the old boring philosophy of
everything is a file and that a file is a stream of bytes, nothing
more.  Modern operating systems such as VMS with basic database
handling in the OS itself, or MacOS or NT with named streams is so
much more modern.  Why don't we get with the times?

It may be because just because of the simplicity it's fairly easy to
use, harder to break och does one thing well.  If you want structured
storage, use a database, on top of the low level primitives, or use
multiple files in a directory.  Why complicate things?

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
