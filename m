From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: bad blocks on disk. Which files are damaged?
Date: Mon, 15 Aug 2005 13:30:28 +0400
Message-ID: <430060B4.7070906@namesys.com>
References: <1124040310.14141.4.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1124040310.14141.4.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Hello

Fionn Behrens wrote:
> Hello all...
> 
> I have a harddisk here which developed bad blocks. It is quite large and
> only a few blocks seem to be affected. I ran several scans wirh the
> "badblocks" tool and got a map of defective blocks out of this. Now I'd
> really like to find out which files on the Reiser3.6 FS on the defective
> disk are probably damaged.
> Is there a way or maybe even a HowTo to tell this without huge effort?

You might want to look at
http://namesys.com/bad-block-handling.html

I believe it is in uptodate state. Yes, Vitaly?

> Maybe even some kind of script or tool?
> 
> best regards, 
> 		Fionn

