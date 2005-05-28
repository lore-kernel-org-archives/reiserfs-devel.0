From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: online fsck
Date: Sat, 28 May 2005 11:58:10 +0400
Message-ID: <1117267090.7083.246.camel@tribesman.namesys.com>
References: <263a8b350505231124758be936@mail.gmail.com>
	 <42930542.1000407@namesys.com>  <4293B817.5030906@accessplus.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4293B817.5030906@accessplus.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: marco <marco@accessplus.com.au>
Cc: "E.Gryaznova" <grev@namesys.com>, btinsley <btinsley@gmail.com>, reiserfs-list@namesys.com

Hello

On Wed, 2005-05-25 at 03:26, marco wrote:
> E.Gryaznova wrote:
> 
> > Hello.
> > reiserfsck can check reiserfs filesystem mounted read-only.
> 
> Running 'fsck.reiserfs --check -y </dev/part>' will do the trick.  The 
> equivalent for ext3 and other filesystems is
> 'fsck -n </dev/part>', the ext3 version detects that it is mounted rw, 
> and does a readonly check.
> 
> What I wonder is if we can get fsck.reiser[fs,4] to honour option 
> processing in a manner more consistant with
> the other fscks, so that adding reiserfs to a list of user choosable 
> filesystems is not going to cause a nightmare
> of an overhead of filesystem detection, command option re-mapping and 
> other related headaches.....
> 

The main problem why reiserfsck does not process similar to other fscks
is that reiserfs (as well as reiser4) moves data on filesystem
modifications so that even files which were not modified recently change
their locations. Online reiserXck should be probably implemented as
kernel thread. Or be able to block filesystem updates, or I do not know
what.
So, in short, reiserXck for r/w mounted filesystem can not be implemened
as plain user land tool,imho.
Also imho, currently the problem is that it is not very clear how to do
it.
We would be happy to hear any thoughts on it.

> >
> > Thanks,
> > Lena
> >
> > btinsley wrote:
> >
> >> Is there or was there a plan to support running reiserfsck on a
> >> mounted v3 filesystem (just a check, not a fix or rebuild)? I seem to
> >> remember this being mentioned here at some point in time, but I was
> >> unable to find it in the mailing list archive.
> >>
> >> Thanks!
> >>
> >>
> >>  
> >>
> >
> >
> >
> >
> >

