From: Herbie Hopkins <Herbie@Hopkins.net>
Subject: Re: slow mount
Date: 12 Jun 2003 16:47:16 +0100
Message-ID: <1055432836.8601.3.camel@terminus.zapto.org>
References: <1055427629.1875.8.camel@terminus.zapto.org>
	 <20030612144609.GA27645@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030612144609.GA27645@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs <reiserfs-list@namesys.com>

Interestingly enough a 20G fs on the same drive takes 0.9s to mount.
Should a 40G partition not take roughly twice as long as a 20G partition
to mount? 

On Thu, 2003-06-12 at 15:46, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Jun 12, 2003 at 03:20:29PM +0100, Herbie Hopkins wrote:
> > It seems to take a very long time to mount a large reiserfs filesystem:
> >   $ time mount /home
> >   real    0m17.259s
> >   /dev/hda7              44G   12G   33G  26% /home
> > is this normal behaviour? as this drastically increases my system statup
> 
> Well. Some kind of a delay is certainly expected, as reiserfs is reading
> all the bitmaps at mount time.
> 
> > time. The same partition formatted to ext3 mounts in less than a second
> > and this also seems to have no reflection on the amount of data on the
> > partition as it still takes this long when the filesystem in empty.
> 
> The bitmaps are there no matter if filesystem is empty or not.
> 
> Only my 20G fs can be mounted in 1.4s, so may be you have some kind of very slow
> drive, or no DMA or something like that?
> 
> Bye,
>     Oleg

