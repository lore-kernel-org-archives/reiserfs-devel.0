From: Oleg Drokin <green@namesys.com>
Subject: Re: How tell what version of reiserfs my filesystem is?
Date: Thu, 4 Apr 2002 09:10:03 +0400
Message-ID: <20020404091003.A5663@namesys.com>
References: <3CAAD745.447646E4@vtc.edu.hk> <20020403151813.A4949@namesys.com> <3CAB6EE8.E8B48CAB@vtc.edu.hk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CAB6EE8.E8B48CAB@vtc.edu.hk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Urbanik <nicku@vtc.edu.hk>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Thu, Apr 04, 2002 at 05:06:48AM +0800, Nick Urbanik wrote:

> I have been using 2.4.19-pre5.  What does this mean in dmesg output:
> Using r5 hash to sort names
> ReiserFS version 3.6.25

It means your filesystem is using r5 hash. Version information is obsolette and
will be removed soon.

> > Also with recent 2.4 kernels (2.4.17+), you can lookup this info
> > in the /proc filesystem if you have enabled CONFIG_REISERFS_PROC_INFO.
> I had it off.
> About CONFIG_REISERFS_PROC_INFO, Configure.help says: "This also
> increases amount of kernel memory required for each mount."
> By approximately how much does it do so?  For six large reiserfs file
> systems?

+8Kb of code (ie, common for no matter how much reiserfs fses you have)
plus ~440 bytes for each filesystem mounted for counters.

Of course there is little performance hit (cpu time eaten) to
actually increment these counters.

Bye,
    Oleg
