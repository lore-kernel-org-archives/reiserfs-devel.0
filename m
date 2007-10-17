From: Christoph Hellwig <hch@infradead.org>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Wed, 17 Oct 2007 09:59:06 +0100
Message-ID: <20071017085906.GB8072@infradead.org>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org> <4713B1E7.2010504@suse.com> <4713C82C.7020609@free.fr>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4713C82C.7020609@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Jeff Mahoney <jeffm@suse.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Mon, Oct 15, 2007 at 10:06:04PM +0200, Laurent Riffard wrote:
> > Here's a patch I worked up the other night that kills off struct file
> > completely from the xattr code. I've tested it locally.
> 
> Sorry Jeff, your patch does not apply on 2.6.23-mm1. The 'struct file'
> removal from reiserfs_xattr_ function is already in -mm
> (make-reiserfs-stop-using-struct-file-for-internal.patch).

We'll need to drop Dave's patch first.  Andrew, can you drop it and
put this one in instead?

