From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Status of fsync() wrt mail servers
Date: Wed, 10 Sep 2003 14:32:44 -0700
Message-ID: <20030910213244.GD1461@matchmail.com>
References: <20030910002953.C14172@unbeatenpath.net> <20030910105102.GA535@rahul.net> <1063192474.18154.355.camel@tiny.suse.com> <20030910114103.GA26767@rahul.net> <1063197048.18155.357.camel@tiny.suse.com> <20030910101821.A15923@unbeatenpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030910101821.A15923@unbeatenpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Sep 10, 2003 at 10:18:21AM -0500, Cameron Moore wrote:
> * mason@suse.com (Chris Mason) [2003.09.10 07:31]:
> > On Wed, 2003-09-10 at 07:41, Bennett Todd wrote:
> > > 2003-09-10T07:14:34 Chris Mason:
> > > > On Wed, 2003-09-10 at 06:51, Bennett Todd wrote:
> > > > > What postfix demands (if you wish to adhere strictly to some
> > > > > peoples' interpretations of RFCs) is that when fsync returns, the
> > > > > filesystem guarantees that even if there's a crash an instant after,
> > > > > the file, data as well as metadata, will be intact when the machine
> > > > > comes up again. This is in support of a desire to positively commit
> > > > > to the sender that the receiving MTA has accepted receipt for a
> > > > > message.
> > > > 
> > > > This is what reiserfs does, the metadata is on disk after an fsync,
> > > > including any renames.
> > > 
> > > Metadata, yes, I've got that. How about the data? Does return from
> > > fsync guarantee that the data will be intact as well?
> > 
> > Yes
> 
> Thanks for hashing this out while I was asleep.  :-)  Guess I'll go
> morph into a die-hard Reiser fan now.  Thanks again

The whole perpose of fsync, is to flush the data to the disk.  That works
even with ext2, but it has the possibility of not flushing the meta-data.

With a journaled filesystem and fsync, you will have the data and meta-data
on the disk after the call returns.

Isn't that part of Posix or sus?
