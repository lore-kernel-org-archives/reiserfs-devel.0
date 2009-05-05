From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [patch 0/3] reiserfs xattr fixups
Date: Tue, 5 May 2009 21:13:05 +0100
Message-ID: <20090505201305.GM8633@ZenIV.linux.org.uk>
References: <20090505193014.926371851@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090505193014.926371851@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Devel <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, May 05, 2009 at 03:30:14PM -0400, Jeff Mahoney wrote:
>  This series consists of three patches:
> 
>  1) rework the bit of locking after Al's privroot lookup patch
>  2) Fix up security xattrs so they don't apply to other xattrs
>  3) Clean up the privroot hiding since we now cache the privroot early

Applied and pushed to for-next
