From: Christoph Hellwig <hch@infradead.org>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Wed, 17 Oct 2007 09:58:32 +0100
Message-ID: <20071017085832.GA8072@infradead.org>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org> <4713B1E7.2010504@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4713B1E7.2010504@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, Laurent Riffard <laurent.riffard@free.fr>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Mon, Oct 15, 2007 at 02:31:03PM -0400, Jeff Mahoney wrote:
> Here's a patch I worked up the other night that kills off struct file
> completely from the xattr code. I've tested it locally.

Looks like a merge of Dave's and my patch :)

ACK from me, I don't care whether it's one or two patches.
