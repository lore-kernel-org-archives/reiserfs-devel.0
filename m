From: prj@po.cwru.edu (Paul Jarc)
Subject: Re: attrib +A doesn't work
Date: Wed, 23 Oct 2002 17:03:31 -0400
Message-ID: <m3iszseukm.fsf@multivac.cwru.edu>
References: <20020905034320.GA11951@yzero>
	<15735.10894.167461.158961@laputa.namesys.com>
	<20020905140132.A19752@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020905140132.A19752@namesys.com> (Oleg Drokin's message of
 "Thu, 5 Sep 2002 14:01:32 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

[Old thread.]

Oleg Drokin <green@namesys.com> wrote:
> On Thu, Sep 05, 2002 at 01:57:34PM +0400, Nikita Danilov wrote:
>> Support for inode attributes was introduced between 2.4.18 and
>> 2.4.19. Take latest reiserfsprogs from ftp.namesys.com, run
>> /sbin/reiserfsck --clean-attributes /your-device, and after that
>> finishes mount with -attrs option.
>
> mount -o attrs in fact.

Should -o attrs be used just once, or every time afterwards?


paul
