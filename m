From: Chris Mason <mason@suse.com>
Subject: Re: Status of fsync() wrt mail servers
Date: 10 Sep 2003 08:30:48 -0400
Message-ID: <1063197048.18155.357.camel@tiny.suse.com>
References: <20030910002953.C14172@unbeatenpath.net>
	 <20030910105102.GA535@rahul.net> <1063192474.18154.355.camel@tiny.suse.com>
	 <20030910114103.GA26767@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030910114103.GA26767@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-09-10 at 07:41, Bennett Todd wrote:
> 2003-09-10T07:14:34 Chris Mason:
> > On Wed, 2003-09-10 at 06:51, Bennett Todd wrote:
> > > What postfix demands (if you wish to adhere strictly to some
> > > peoples' interpretations of RFCs) is that when fsync returns, the
> > > filesystem guarantees that even if there's a crash an instant after,
> > > the file, data as well as metadata, will be intact when the machine
> > > comes up again. This is in support of a desire to positively commit
> > > to the sender that the receiving MTA has accepted receipt for a
> > > message.
> > 
> > This is what reiserfs does, the metadata is on disk after an fsync,
> > including any renames.
> 
> Metadata, yes, I've got that. How about the data? Does return from
> fsync guarantee that the data will be intact as well?

Yes

-chris


