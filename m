From: Michael James <Michael.James@csiro.au>
Subject: Re: Reiser4 on SuSE 9.1
Date: Mon, 7 Jun 2004 16:00:40 +1000
Message-ID: <200406071600.40914.Michael.James@csiro.au>
References: <200406041414.HAA14660@amber.he.net> <1086359021.22636.3685.camel@watt.suse.com>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086359021.22636.3685.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sat, 5 Jun 2004 12:23 am, Chris Mason wrote:
> On Fri, 2004-06-04 at 10:14, Mike Young wrote:
> > Has anyone put Reiser4 on the latest SuSE 9.1 release?  I'd like to use it
> > there without having to patch a pristine kernel.  Preferably, I'd like to be
> > able to use their RPM build environment so I can continue to take updates
> > from SuSE.
> > 
> > I've placed a couple of requests into their support group, but have gotten
> > nowhere with them.
> > 
> > Anyone got a suggestion.  I can patch kernels.  I just haven't deciphered
> > the build environment.  I'm use to doing this in a chroot environment.
> 
> We're interested in v4 of course, as things stabilize we'll consider
> including it.  This doc is fairly up to date, and it might help you
> figure out the suse build setup:
> 
> http://www.suse.de/~agruen/kernel-doc/

Thanks for the link. I'll try and get the modules compiled.
I'd also like to use a kernel as close to suse's as possible.

I'll be bringing up a sub-cluster to test Suse 9.1 soon.
Currently the cluster nodes run Suse 8.2.

I'd love to use reiser4 to hold the genetic database files.

These I download from Genbank as gz text files
 then use scripts to automatically index and load them for searching.

So they can be re-created and re-loaded anytime.
The filesystem will get flogged (mainly reading)
I'll see if there are performance gains
 compared with reiserfs.

It's an ideal situation to test a filesystem.

michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166
