From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 18:38:37 +0200
Message-ID: <200508231838.37372.chrivers@iversen-net.dk>
References: <194f62550508230539a1c81d9@mail.gmail.com> <430B31E4.6080807@slaphack.com> <194f625505082308514acb124f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f625505082308514acb124f@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 23 August 2005 17:51, Clemens Eisserer wrote:
> Hi David,
>
> > So, the simplest way is to do "-a noatime", unless you really need the
> > atime updates.  It'll boost your performance, too...
>
> Wow! To be honest I was a bit skeptic wether would work but like magic
> ... the drive goes into standby and wakes only up if something really
> needs disk access or the kernel is swapping.
> Really great - think this will really do wonders to hd lifetime :-)

Are you sure? Common "knowledge" (empiric and anecdotal evidence) says that a 
spin-up/spin-down cycle costs significantly more "lifetime" than running the 
drive for the same amount of time. You really have to have extremely few 
spin-ups for this to have any positive effect, IMHO. 

-- 
Regards,
Christian Iversen
