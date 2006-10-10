From: Nick Piggin <npiggin@suse.de>
Subject: Re: reiserfs set_page_dirty vs truncate race?
Date: Tue, 10 Oct 2006 17:08:56 +0200
Message-ID: <20061010150856.GF2431@wotan.suse.de>
References: <20061010074426.GD14557@wotan.suse.de> <200610101829.28052.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200610101829.28052.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, Oct 10, 2006 at 06:29:27PM +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> On Tuesday 10 October 2006 11:44, Nick Piggin wrote:
> > Hi,
> > 
> > I wonder if resierfs needs to be careful about truncated pages, 
> 
> I think it is assumed that __set_page_dirty_nobuffers and __set_page_dirty_buffers care about truncated pages.

So they may operate on truncated pages? Then you probably need the fix.
Anyway, if you would like to merge it, you may add a
Signed-off-by: Nick Piggin <npiggin@suse.de>

Thanks,
Nick
