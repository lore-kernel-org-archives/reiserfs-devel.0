From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] reiser4: fix readv
Date: Thu, 14 Sep 2006 15:15:06 +0400
Message-ID: <200609141515.06532.vs@namesys.com>
References: <200609132212.54871.vs@namesys.com> <20060914092829.GA13737@hermes.uziel.local> <eebb8l$jg6$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eebb8l$jg6$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thursday 14 September 2006 14:35, Peter wrote:
> On Thu, 14 Sep 2006 11:28:29 +0200, Christian Trefzer wrote:
> 
> > Hi Vladimir,
> > 
> > this fixes a bunch of random user space oddities for me. Just patched
> > 2.6.18-rc6-mm2 with this, and some annoyances I could not trace back to
> > a change in user space just went bye-bye.
> > 
> > Thanks a lot!
> > Chris
> 
> This does not patch against 2.6.17-3 patchset however. 

2.6.17-3 does not have the problem which that patch fixes. So you do not need it.

> Any possibility 
> this may be related to some startup issues as noted on other threads here?
> 

no. 

> Thx
> 
