From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] reiserfs: remove stray unlock_super in reiserfs_resize
Date: Thu, 18 Jun 2009 23:18:20 +0200
Message-ID: <20090618211820.GA28679@lst.de>
References: <20090423192512.GA22819@lst.de> <49F0C2AD.6070502@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49F0C2AD.6070502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, reiserfs-devel@vger.kernel.org

On Thu, Apr 23, 2009 at 09:34:05PM +0200, Edward Shishkin wrote:
> Christoph Hellwig wrote:
> >Reiserfs doesn't use lock_super anywhere internally, and ->remount_fs
> >which calls reiserfs_resize does have it currently but also expects it
> >to be held on return, so there's no business for the unlock_super here.
> >
> >
> >Signed-off-by: Christoph Hellwig <hch@lst.de>
> >  
> 
> Acked by Edward Shishkin <edward.shishkin@gmail.com>

Do you plan to push this to Linus?

