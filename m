From: prj@po.cwru.edu (Paul Jarc)
Subject: Re: attrib +A doesn't work
Date: Thu, 24 Oct 2002 11:22:07 -0400
Message-ID: <m3k7k7vp3e.fsf@multivac.cwru.edu>
References: <20020905034320.GA11951@yzero>
	<15735.10894.167461.158961@laputa.namesys.com>
	<20020905140132.A19752@namesys.com> <m3iszseukm.fsf@multivac.cwru.edu>
	<15799.37953.280992.61682@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <15799.37953.280992.61682@laputa.namesys.com> (Nikita Danilov's
 message of "Thu, 24 Oct 2002 10:33:37 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Nikita Danilov <Nikita@Namesys.COM> wrote:
> Paul Jarc writes:
>> Should -o attrs be used just once, or every time afterwards?
>
> On each mount. Does attribute support actually works for you?

I just did a quick test with chattr +A, and it seemed to work.  Out of
curiosity, what would happen if I forgot to use attrs once?  I'm
guessing attributes would not take effect and could not be changed
until I remounted, but once I did, the stored attributes wouldn't be
lost, right?  Also, is there any way to make attrs and notail show up
in /proc/mounts?


paul
