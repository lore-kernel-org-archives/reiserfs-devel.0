From: Nick Urbanik <nicku@vtc.edu.hk>
Subject: Re: How tell what version of reiserfs my filesystem is?
Date: Fri, 05 Apr 2002 09:37:44 +0800
Sender: nicku@nicksbox.tyict.vtc.edu.hk
Message-ID: <3CACFFE8.6D1AA53B@vtc.edu.hk>
References: <3CAAD745.447646E4@vtc.edu.hk> <20020403151813.A4949@namesys.com> <3CAB6EE8.E8B48CAB@vtc.edu.hk> <20020404091003.A5663@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Oleg Drokin wrote:

> > > Also with recent 2.4 kernels (2.4.17+), you can lookup this info
> > > in the /proc filesystem if you have enabled CONFIG_REISERFS_PROC_INFO.
> > I had it off.
> > About CONFIG_REISERFS_PROC_INFO, Configure.help says: "This also
> > increases amount of kernel memory required for each mount."
> > By approximately how much does it do so?  For six large reiserfs file
> > systems?
>
> +8Kb of code (ie, common for no matter how much reiserfs fses you have)
> plus ~440 bytes for each filesystem mounted for counters.
>
> Of course there is little performance hit (cpu time eaten) to
> actually increment these counters.

I'll enable it in my future kernel builds.  Thank you again, Oleg.

--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24



