From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: attrib +A doesn't work
Date: Thu, 24 Oct 2002 10:33:37 +0400
Message-ID: <15799.37953.280992.61682@laputa.namesys.com>
References: <20020905034320.GA11951@yzero>
	<15735.10894.167461.158961@laputa.namesys.com>
	<20020905140132.A19752@namesys.com>
	<m3iszseukm.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3iszseukm.fsf@multivac.cwru.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Paul Jarc writes:
 > [Old thread.]
 > 
 > Oleg Drokin <green@namesys.com> wrote:
 > > On Thu, Sep 05, 2002 at 01:57:34PM +0400, Nikita Danilov wrote:
 > >> Support for inode attributes was introduced between 2.4.18 and
 > >> 2.4.19. Take latest reiserfsprogs from ftp.namesys.com, run
 > >> /sbin/reiserfsck --clean-attributes /your-device, and after that
 > >> finishes mount with -attrs option.
 > >
 > > mount -o attrs in fact.
 > 
 > Should -o attrs be used just once, or every time afterwards?
 > 

On each mount. Does attribute support actually works for you?

 > 
 > paul

Nikita.
