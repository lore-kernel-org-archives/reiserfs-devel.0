From: Oleg Drokin <green@namesys.com>
Subject: Re: on-disk bitmap does not match to the correct one
Date: Wed, 3 Apr 2002 15:20:43 +0400
Message-ID: <20020403152043.B4949@namesys.com>
References: <3CAAD714.3223F1B6@vtc.edu.hk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CAAD714.3223F1B6@vtc.edu.hk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Urbanik <nicku@vtc.edu.hk>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Apr 03, 2002 at 06:19:00PM +0800, Nick Urbanik wrote:

> I am concerned by a constant recurence of the output of reiserfsck run
> on two of my partitions, shown at the end of this mail.
> I do not understand what the bitmaps are, nor what to do about the
> mismatch.

It means you have more free space than it is reported in the free blocks
counters.
Bitmaps are maps with which FS is tracking blocks usage.
If you are running kernel 2.4.16 or older, this might be because
some aplication deleted some files, but still have the files open,
andthen crash occured.
2.4.16 or earlier kernels are not recommended to use.

Bye,
    Oleg
