From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: early flushing of data
Date: Mon, 12 Aug 2002 16:05:29 +0200
Message-ID: <20020812140529.GY282@hvs.envisage.co.za>
References: <3D57BDA3.2010903@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D57BDA3.2010903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Aug 12, 2002 at 05:52:35PM +0400, Hans Reiser wrote:
> I just thought that discussion of this might interest the list.
> 
> It is interesting to consider whether one should flush dirty nodes to 
> disk with only a small delay after they are modified, or keep them in 
> cache for a longer time.
[snip]
> Your thoughts are welcome.

Being in love with buttons-an-dials, I'd vote for a configurable flush
setting.

I have the case were one email server (basically a hop in the queue) would do
well with the longer flushes as the data wouldn't be that long before it's
shipped out again (given no failure conditions), while I have others which
I'd like to have it to disk ASAP as it'll be taking awhile before it get's
moved along again.

Thus a configurable setting (would love/prefer a per mount setting ie.
one for my log mount, and the other for the email mounts etc.) would
be nice.

