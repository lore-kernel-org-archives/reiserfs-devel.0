From: Nick Urbanik <nicku@vtc.edu.hk>
Subject: Re: How tell what version of reiserfs my filesystem is?
Date: Thu, 04 Apr 2002 05:06:48 +0800
Sender: nicku@nicksbox.tyict.vtc.edu.hk
Message-ID: <3CAB6EE8.E8B48CAB@vtc.edu.hk>
References: <3CAAD745.447646E4@vtc.edu.hk> <20020403151813.A4949@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

Oleg Drokin wrote:

> > How do I tell whether each of my file systems is 3.5 or 3.6?
>
> If you run 2.2.x kernel, then you have reiserfs v3.5
> If you have 2.[45].x kernel, then look it to the dmesg output
> (or in the boot logs). If there is following message appears
> after reiserfs mount messages: 'reiserfs: using 3.5.x disk format',
> it means that filesystem is v3.5 format,
> otherwise it is v3.6 format.

So I must be using v3.6 format, though I created these file systems a
very long time ago, but with a 2.4.x kernel.

I have been using 2.4.19-pre5.  What does this mean in dmesg output:
Using r5 hash to sort names
ReiserFS version 3.6.25

> Also with recent 2.4 kernels (2.4.17+), you can lookup this info
> in the /proc filesystem if you have enabled CONFIG_REISERFS_PROC_INFO.

I had it off.
About CONFIG_REISERFS_PROC_INFO, Configure.help says: "This also
increases amount of kernel memory required for each mount."

By approximately how much does it do so?  For six large reiserfs file
systems?

Thank you, Oleg.

--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24



