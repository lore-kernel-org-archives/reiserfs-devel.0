From: Oleg Drokin <green@namesys.com>
Subject: Re: on-disk bitmap does not match to the correct one
Date: Thu, 4 Apr 2002 08:53:10 +0400
Message-ID: <20020404085310.A5629@namesys.com>
References: <3CAAD714.3223F1B6@vtc.edu.hk> <20020403152043.B4949@namesys.com> <3CAB6FA3.C6769B4F@vtc.edu.hk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CAB6FA3.C6769B4F@vtc.edu.hk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Urbanik <nicku@vtc.edu.hk>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Apr 04, 2002 at 05:09:56AM +0800, Nick Urbanik wrote:
> > Bitmaps are maps with which FS is tracking blocks usage.
> > If you are running kernel 2.4.16 or older, this might be because
> > some aplication deleted some files, but still have the files open,
> > andthen crash occured.
> > 2.4.16 or earlier kernels are not recommended to use.
> I have been using 2.4.19-pre5, though I had a couple of crashes over the
> years with earlier 2.4.x kernels.
> So what should/can I do about this mismatch?

Get latest reiserfsprogs package (3.x.1b) and run reiserfsck --rebuild-tree
on your partition.

Bye,
    Oleg
