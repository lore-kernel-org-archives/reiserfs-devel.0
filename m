From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: 24 Nov 2004 15:25:54 +0000
Message-ID: <1101309954.2779.15.camel@pear.st-and.ac.uk>
References: <2c59f00304112205546349e88e@mail.gmail.com>
	 <41A1FFFC.70507@hist.no> <41A21EAA.2090603@dbservice.com>
	 <41A23496.505@namesys.com> <1101287762.1267.41.camel@pear.st-and.ac.uk>
	 <4d8e3fd304112407023ff0a33d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4d8e3fd304112407023ff0a33d@mail.gmail.com>
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, 2004-11-24 at 15:02, Paolo Ciarrocchi wrote:
> On 24 Nov 2004 09:16:03 +0000, Peter Foldiak
> <peter.foldiak@st-andrews.ac.uk> wrote:
> [...] 
> > I would really like to implement this for the next version of Hans' file
> > system.
> 
> I don't undersand how you want to use Xpath for not XML file.
> I agree with you that the idea behind Xpath is cool but I fail to
> unserstand how it can be applied to anything but XML

My message was mainly about XML, for which it is easy.
For non-XML, you need some other way of knowing the file format. The
example that originally came up in this thread was

/etc/passwd/[username]

In this case, the passwd file has a known format.
Other file types, like LaTex, html, jpeg also have (at least partially)
known formats. Some selection should be possible even for unknown
formats (e.g. byte range, line-range). There could also be some way of
specifying a new format but I don't know how to do this well. You could
give names (like filenames) to parts of files.
But I think the first step would be to concentrate on XML, and worry
about the rest later.   Peter

