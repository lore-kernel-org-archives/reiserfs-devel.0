From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: Tue, 10 May 2005 16:32:10 +0100
Message-ID: <1115739129.3711.117.camel@grape.st-and.ac.uk>
References: <2c59f00304112205546349e88e@mail.gmail.com>
	 <41A1FFFC.70507@hist.no> <41A21EAA.2090603@dbservice.com>
	 <41A23496.505@namesys.com>  <1101287762.1267.41.camel@pear.st-and.ac.uk>
	 <1115717961.3711.56.camel@grape.st-and.ac.uk>
	 <4280CAEF.5060202@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4280CAEF.5060202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: sean.mcgrath@propylon.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, 2005-05-10 at 15:53, Hans Reiser wrote:
> I agree with the below in that sometimes you want to see a collection of
> stuff as one file, and sometimes you want to see it as a tree, and that
> file format browsers can be integrated into file system browsers to look
> seamless to users.
> 
> A quibble: A name is just a means to select a file; he is completely
> wrong to think that file browsers will eliminate filenames.

Yes, even if you think of the whole file system as a single "file", you
need a way to select the bit you need, and you will use names for that
(and whether you call that a filename, a file-part name or an object
name doesn't really matter).

It is interesting that both he and I gave the example of a book and
chapters, which is essentially a linear sequence, and the issue was just
the selection of a part of that sequence. It would also be interesting
to think about how you could map an arbitrary data structure more
complicated than a linear sequence (an "object") to disk. This brings up
issues of serialization and object databases....

