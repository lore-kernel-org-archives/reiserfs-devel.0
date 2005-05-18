From: Leo Comerford <leocomerford@gmail.com>
Subject: Re: file as a directory
Date: Wed, 18 May 2005 12:46:38 +0100
Message-ID: <ff801084050518044662413245@mail.gmail.com>
References: <ff80108405051605321df0d764@mail.gmail.com>
	 <92232506676-BeMail@cr593174-a>
Reply-To: lrc1@st-and.ac.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <92232506676-BeMail@cr593174-a>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: sean.mcgrath@propylon.com, reiserfs-list@namesys.com, Peter.Foldiak@st-andrews.ac.uk

> And then there are ReiserFS plugins, which might give you a magic
> directory that when read for data, yields the concatenation of its
> children's data contents.

Better, you could have a little custom filesystem which can take the
/(something)/concatenation/zebra: subgraph as its device and generate
a single file which is the concatenation of zebra:1, zebra:2, and so
on. (Remember that we can redefine 'file' as 'an atomic file or a link
between files'. So since the zebra: subgraph is a file, we can mount
it!) We could also have, for example, a pair of filesystems, one which
can mount an XML file and present it as an instance of an XML-document
association, and another which can mount such a link and present it as
a flat XML file.

Leo.
