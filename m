From: Chris Mason <mason@suse.com>
Subject: Re: Ordered journaling in 2.5.X
Date: 16 May 2002 11:16:17 -0400
Message-ID: <1021562177.14986.797.camel@tiny>
References: <HAEOIKGLLLDPLCHFOMMOIEDACAAA.jordan.breeding@inet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <HAEOIKGLLLDPLCHFOMMOIEDACAAA.jordan.breeding@inet.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jordan Breeding <jordan.breeding@inet.com>
Cc: reiserfs-list@namesys.com, Jordan Breeding <jordan.breeding@attbi.com>

On Thu, 2002-05-16 at 11:09, Jordan Breeding wrote:
> Hello,
> 
>   I seem to remeber a while back Chris Mason posting a beta patch for
> reiserfs in 2.4.x which added ordered journaling as a mount option to
> reiserfs.  Is there any chance that this is being looked into more as a
> possible item for reiserfs in 2.5.x?
>

Yes.  The whole data logging patch (with write ordered support) will
most likely get merged into 2.5.x first, as part of stability testing.

-chris


