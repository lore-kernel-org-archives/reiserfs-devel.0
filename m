From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 17:15:34 +0300
Message-ID: <1079014534.9475.265.camel@tribesman.namesys.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
	 <1078997330.9476.246.camel@tribesman.namesys.com>
	 <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jlewis@lewis.org
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-03-11 at 16:58, jlewis@lewis.org wrote:
> On Thu, 11 Mar 2004, Vladimir Saveliev wrote:
> 
> > > some of the files isn't possible.  Am I correct in assuming that stopping
> > > reiserfsck before the rebuild-tree finishes would be "bad"...i.e. we won't
> > > be able to access the data, and would have to start over anyway?
> > >
> > Yes
> 
> The next question then is, if we have to stop it and start over, will
> reiserfsck be able to start over with as much chance of success as we had
> the first time...or are we likely to lose lots of data by doing this?
> 

reiserfsck will start from the beginning. You should not lose data
because of this.

> > Yes, this looks like reiserfsck got into endless loop. If it is still
> > there lets break and fix reiserfsck bug.
> > For this we need you to do extract filesystem metadata with
> >
> > debugreiserfs -p /dev/thatdevice | bzip2 -c > metadata.bz2
> >
> > and allow us to download that file.
> 
> How soon could we expect a response to that?  

fsck maintainer will work on it when he is on his working place. Now he
is not, though
Btw, is reiserfsck still looping in its semantic pass?

> The $25 (or multiples of
> that) support option, if that would speed it up, is no problem.
> 
fixing reiserfs bugs has nothing to do with this $25 thing.


> > > Is there any possibility of getting to the data (most of it anyway) on
> > > this partition if we have to stop the rebuild before it completes?...i.e.
> > > if it really is caught in a loop.
> 
> Is there any way to at least get the system back to the state it was in
> before --rebuild-tree started?  i.e. make the partition mountable, and try
> to extract as much data as we can from it...or are we stuck at this point
> needing --rebuild-tree to finish/start over and finish before we can try
> getting at the data again?
> 
reiserfsck --rebuild-tree must complete

> I kind of doubt broken hardware.  There have been no error messages from
> the i2o driver (it likes to whine if there are disk problems) and in my
> experience, if we had bad CPUs or RAM, it wouldn't run this long...it'd be
> randomly crashing.
> 
> ----------------------------------------------------------------------
>  Jon Lewis *jlewis@lewis.org*|  I route
>  Senior Network Engineer     |  therefore you are
>  Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
> 
> 

