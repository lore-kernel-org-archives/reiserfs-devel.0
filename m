From: <doiggl@velocitynet.com.au>
Subject: Re: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Thu, 09 Dec 2010 00:13:35 +1100
Message-ID: <f6c1e36ad68ee3e4f57925e2f9969f40@mail.velocitynet.com.au>
References: <4CE7F21B.4050605@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CE7F21B.4050605@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Sat, 20 Nov 2010 11:06:51 -0500, Jeff Mahoney <jeffm@suse.com> wrote:
> This patch contains the basic implementation for reiserfs 3.7.
> 
>  Specifically, it extends reiserfs 3.6 to allow feature compatibility
bits.
>  Since it extends v3.6, it assumes allowing a nonstandard journal, so
some
>  paths have been adjusted to test for a nonstandard journal instead of
>  just having the JR superblock magic.
> 
>  I don't have any large plans to extend beyond some very basic features,
>  although extended attributes would be much more efficiently implemented
>  if they were first class items instead of hidden files.
> 
>  The next patch in the series adds support to allow v2 stat data items
>  to describe the number of blocks in fs-blocksize blocks instead of
>  512 byte blocks.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>

Thanks for the information. Is the module available for testing?.
If so, where can I get the module from and can it be used  it with the
opensuse factory series?

Cheers Glenn 
