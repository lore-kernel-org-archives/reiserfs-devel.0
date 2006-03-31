From: rvalles <rvalles@es.gnu.org>
Subject: Re: IO randomly blocked for >1 minute while disk writes still in 2.6.16.1 + 2.6.16-reiser4-1
Date: Fri, 31 Mar 2006 04:24:00 +0200
Message-ID: <30622.326283674$1143771890@news.gmane.org>
References: <20060330023909.GA7547@rvalles.homedns.org.> <442C1B0B.4060207@namesys.com> <20060331013339.GA25167@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060331013339.GA25167@rvalles.homedns.org.>
Sender: <tux@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

On Fri, Mar 31, 2006 at 03:33:39AM +0200, rvalles wrote:
> On Thu, Mar 30, 2006 at 09:53:15AM -0800, Hans Reiser wrote:
> > rvalles wrote:
> > 
> > >A few months ago I posted about a problem I was having with kernels
> > >newer than 2.6.12.x, where, apparently randomly, sometimes vim or other
> > >programs would be blocked for more than a minute, and during the entire
> > >blockage, the disk would appear to be writing data.
> > >
> > >Since I saw talk on the matter, I thought it would be the mmap/fsync
> > >performance problem or something like that, and after so much time it
> > >would be fixed already, but apparently it isn't yet, which I discovered
> > >after building a 2.6.16.1 with the 2.6.16-reiser4-1 patch available on
> > >the namesys ftp server.
> > >
> > >Soon after booting my desktop system and starting X, xfce, etc. I
> > >started to wget the latest knoppix ISO and then started to play a movie
> > >with mplayer. The movie is an avi ffmpeg + mp3 at about 1mbit/s overall.
> > >The described blockings happened again and again during the reproduction
> > >of the movie. Now, just to know the format, I played it again, and as it
> > >began, it blocked again... not even knoppix is downloading on the
> > >background.
> > >
> > >I got knoppix so that I could boot it, get last reiser4tools and run a
> > >fsck --fix on my reiser4 partition. Since now I've already done that, I
> > >don't think it helped much.
> > >
> > >I attach my kernel config file. I'll be very happy to provide any other
> > >debug information if it's needed, or to test patches and see if they fix
> > >the problem. For now, I'll fall back to 2.6.12.6, which is the latest
> > >kernel I can use which doesn't have the problem.
> > >
> > >Sincerelly,
> > >Roc Vallès <rvalles@es.gnu.org>
> > >  
> > >
> > There is another possible explanation for your problem.  That other
> > explanation will be much more work for us to fix, so please tell us if
> > the patch you were sent fixes it, and if not then we have to do the hard
> > fix.
> > 
> > Hans
> > 
> 
> I set the kernel to build and went to sleep. Woke up now, and I'm
> rebooting to see how the patch does fare. I'll report back at the first
> occurrence of the problem or after 24h, whichever happens first.
>
After a few minutes of use, I exited "kismet" and it "locked". It's been
like 15 minutes already, but kismet hasn't succeed exiting. A kill -9
won't kill it either. The HD led is on, gkrellm reports continous
writing in the partition at a rate of about 500KB/s. Reading the maildir
for reiserfs list (1500 mails or so) was sloooooow too. I believe the
patch just makes things worse, never had a "lock" last more than two
minutes ever before.

Hopefully the other explanation is correct and we can bury this problem
forever soon. As I'm typing, the "lock" ended and the process finally
died, which means it took about 20 minutes.

Going to reboot into 2.6.12.6 again once I confirm on exim logs that the
mail got sent, since I can't really use the computer with this kernel.

I'll be happy to test other patches and see if they fix the problem or
not.

Thanks.

Roc Vallès
rvalles@es.gnu.org

-- 
- Do you study theories? - Oh yes! Theories are fun. - How do you use them? - When I must act, theories are too slow. To act, I must know.
