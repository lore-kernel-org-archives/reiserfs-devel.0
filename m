From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: attrib +A doesn't work
Date: Thu, 24 Oct 2002 19:50:23 +0400
Message-ID: <15800.5823.484584.373537@laputa.namesys.com>
References: <20020905034320.GA11951@yzero>
	<15735.10894.167461.158961@laputa.namesys.com>
	<20020905140132.A19752@namesys.com>
	<m3iszseukm.fsf@multivac.cwru.edu>
	<15799.37953.280992.61682@laputa.namesys.com>
	<m3k7k7vp3e.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3k7k7vp3e.fsf@multivac.cwru.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Paul Jarc writes:
 > Nikita Danilov <Nikita@Namesys.COM> wrote:
 > > Paul Jarc writes:
 > >> Should -o attrs be used just once, or every time afterwards?
 > >
 > > On each mount. Does attribute support actually works for you?
 > 
 > I just did a quick test with chattr +A, and it seemed to work.  Out of
 > curiosity, what would happen if I forgot to use attrs once?  I'm
 > guessing attributes would not take effect and could not be changed
 > until I remounted, but once I did, the stored attributes wouldn't be
 > lost, right?  Also, is there any way to make attrs and notail show up
 > in /proc/mounts?

Only after Halloween, I am afraid.

 > 
 > 
 > paul

Nikita.
