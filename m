From: Oleg Drokin <green@namesys.com>
Subject: Re: attrib +A doesn't work
Date: Thu, 5 Sep 2002 14:01:32 +0400
Message-ID: <20020905140132.A19752@namesys.com>
References: <20020905034320.GA11951@yzero> <15735.10894.167461.158961@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15735.10894.167461.158961@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Thu, Sep 05, 2002 at 01:57:34PM +0400, Nikita Danilov wrote:

> Support for inode attributes was introduced between 2.4.18 and
> 2.4.19. Take latest reiserfsprogs from ftp.namesys.com, run
> /sbin/reiserfsck --clean-attributes /your-device, and after that
> finishes mount with -attrs option.

mount -o attrs in fact.

Bye,
    Oleg
