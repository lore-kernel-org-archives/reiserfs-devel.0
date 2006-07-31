From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 16:21:28 -0700
Message-ID: <5c49b0ed0607311621i54f1c46fh9137f8955c9ea4be@mail.gmail.com>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
	 <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl>
	 <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
	 <44CE7C31.5090402@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CE7C31.5090402@gmx.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 7/31/06, Matthias Andree <matthias.andree@gmx.de> wrote:
> Adrian Ulrich wrote:
>
> > See also: http://spam.workaround.ch/dull/postmark.txt
> >
> > A quick'n'dirty ZFS-vs-UFS-vs-Reiser3-vs-Reiser4-vs-Ext3 'benchmark'
>
> Whatever Postmark does, this looks pretty besides the point.

why's that?  postmark is one of the standard benchmarks...

> Are these actual transactions with the "D"urability guarantee?
> 3000/s doesn't look too much like you're doing synchronous I/O (else
> figures around 70/s perhaps 100/s would be more adequate), and cache
> exercise is rather irrelevant for databases that manage real (=valuable)
> data...

Data:
        204.62 megabytes read (8.53 megabytes per second)
        271.49 megabytes written (11.31 megabytes per second)

looks pretty I/O bound to me, 11.31 MB/s isn't exactly your latest DDR
RAM bandwidth.  as far as the synchronous I/O question, Reiser4 in
this case acts more like a log-based FS.  That allows it to "overlap"
synchronous operations that are being submitted by multiple threads.

NATE
