From: Chris Mason <mason@suse.com>
Subject: Re: reiserfsprogs release
Date: 10 Jul 2002 10:44:32 -0400
Message-ID: <1026312272.5663.227.camel@tiny>
References: <200206251829.25799.vitaly@namesys.com>
	<20020625165254.GA30301@matrix.wg> <200206261317.10813.vitaly@namesys.com>
	<200207101206.48370.vitaly@namesys.com>
	<1026311034.7074.76.camel@spc9.esa.lanl.gov> 
	<20020710153801.A8570@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020710153801.A8570@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Steven Cole <elenstev@mesatop.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Marcelo Tosatti <marcelo@conectiva.com.br>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Wed, 2002-07-10 at 10:38, Christoph Hellwig wrote:
> On Wed, Jul 10, 2002 at 08:23:54AM -0600, Steven Cole wrote:
> > On Wed, 2002-07-10 at 02:06, Vitaly Fertman wrote:
> > > 
> > > Hi all,
> > > 
> > > the latest reiserfsprogs-3.6.2 is available on our ftp site.
> > > 
> > 
> > Is the following patch to Documentation/Changes appropriate?
> 
> Does reiserfs in 2.4.19-pre require that version?  if yes it would be
> very bad (2.4 is not supposed to need newer userlevel during the series)

No, it does not require that version.  It is a good idea since fsck
improves with each release though ;-)

-chris


