From: Chris Mason <mason@suse.com>
Subject: Re: Status of fsync() wrt mail servers
Date: 10 Sep 2003 07:14:34 -0400
Message-ID: <1063192474.18154.355.camel@tiny.suse.com>
References: <20030910002953.C14172@unbeatenpath.net>
	 <20030910105102.GA535@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030910105102.GA535@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-09-10 at 06:51, Bennett Todd wrote:
> 2003-09-10T01:29:53 lists@unbeatenpath.net:
> > I'm in the process of researching OSes and filesystems for a new mail
> > system.  I'm hoping to use linux+reiserfs+postfix, and I'm wondering
> > where reiserfs stands wrt to fsync().  Does reiserfs provide a mechanism
> > to have truly synchronous writes with a single fsync() call?  Thanks
> 
> I'm not really fond of the phrase "truly synchronous writes"; it can
> be read different ways by different people.
> 
> What postfix demands (if you wish to adhere strictly to some
> peoples' interpretations of RFCs) is that when fsync returns, the
> filesystem guarantees that even if there's a crash an instant after,
> the file, data as well as metadata, will be intact when the machine
> comes up again. This is in support of a desire to positively commit
> to the sender that the receiving MTA has accepted receipt for a
> message.

This is what reiserfs does, the metadata is on disk after an fsync,
including any renames.

-chris

