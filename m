From: Nick Urbanik <nicku@vtc.edu.hk>
Subject: Re: on-disk bitmap does not match to the correct one
Date: Fri, 05 Apr 2002 09:35:34 +0800
Sender: nicku@nicksbox.tyict.vtc.edu.hk
Message-ID: <3CACFF66.5361BD3@vtc.edu.hk>
References: <3CAAD714.3223F1B6@vtc.edu.hk> <20020403152043.B4949@namesys.com> <3CAB6FA3.C6769B4F@vtc.edu.hk> <20020404085310.A5629@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

> Hello!
>
> On Thu, Apr 04, 2002 at 05:09:56AM +0800, Nick Urbanik wrote:
> > > Bitmaps are maps with which FS is tracking blocks usage.
> > > If you are running kernel 2.4.16 or older, this might be because
> > > some aplication deleted some files, but still have the files open,
> > > andthen crash occured.
> > > 2.4.16 or earlier kernels are not recommended to use.
> > I have been using 2.4.19-pre5, though I had a couple of crashes over the
> > years with earlier 2.4.x kernels.
> > So what should/can I do about this mismatch?
>
> Get latest reiserfsprogs package (3.x.1b) and run reiserfsck --rebuild-tree
> on your partition.

Beautiful!  It worked!  While I was at it, I did a lot of LVM volume resizing,
and at one stage lost the root directory of my /var/ftp partition, but
thankfully (wipes panicky sweat from brow!!!!), reiserfsck --rebuild-tree
rebuilt it successfully.

The spec file in the tarball made building an RPM package a snap; it's really
well written.

Thank you very much, Oleg.  As we say in Australia, "Your blood's worth
bottling!" :-)

--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24



