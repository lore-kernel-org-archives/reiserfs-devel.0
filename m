From: Nick Urbanik <nicku@vtc.edu.hk>
Subject: Re: on-disk bitmap does not match to the correct one
Date: Thu, 04 Apr 2002 05:09:56 +0800
Sender: nicku@nicksbox.tyict.vtc.edu.hk
Message-ID: <3CAB6FA3.C6769B4F@vtc.edu.hk>
References: <3CAAD714.3223F1B6@vtc.edu.hk> <20020403152043.B4949@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

> Hello!
>
> On Wed, Apr 03, 2002 at 06:19:00PM +0800, Nick Urbanik wrote:
>
> > I am concerned by a constant recurence of the output of reiserfsck run
> > on two of my partitions, shown at the end of this mail.
> > I do not understand what the bitmaps are, nor what to do about the
> > mismatch.
>
> It means you have more free space than it is reported in the free blocks
> counters.
> Bitmaps are maps with which FS is tracking blocks usage.
> If you are running kernel 2.4.16 or older, this might be because
> some aplication deleted some files, but still have the files open,
> andthen crash occured.
> 2.4.16 or earlier kernels are not recommended to use.

I have been using 2.4.19-pre5, though I had a couple of crashes over the
years with earlier 2.4.x kernels.

So what should/can I do about this mismatch?

--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24



