From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: programming methodology terminology
Date: Tue, 31 Jan 2006 07:04:53 +0100
Message-ID: <200601310704.53929.chrivers@iversen-net.dk>
References: <43DDBD1D.6030900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43DDBD1D.6030900@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 30 January 2006 08:15, Hans Reiser wrote:
> suppose there are two distinct layers of abstraction, one on top of the
> other.  Suppose someone uses the error condition names of the top layer
> in coding the bottom layer when the return values it is used for in the
> bottom layer have not the same purpose as those of the top layer, and
> when it would be an error for the return value to actually get
> propagated all the way out of the top layer.  What is this bad
> programming practice called, there is a name for it isn't there?  When
> you use a return value #define for two different meanings, is there a
> name for that?  It is generally accepted to be bad style, yes?

I'd say it's definitely a layering violation - but I don't know if there's a 
more specific name for this particular situation.

-- 
Regards,
Christian Iversen
