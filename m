From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: attrib +A doesn't work
Date: Thu, 5 Sep 2002 13:57:34 +0400
Message-ID: <15735.10894.167461.158961@laputa.namesys.com>
References: <20020905034320.GA11951@yzero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020905034320.GA11951@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Tom Vier writes:
 > i thought 3.6 support attribs (or at least some of them), but A isn't
 > working. i ran touch test; chattr +A test; stat test; cat test; stat test;
 > the second stat showed an updated atime.
 > 
 > is there some undocumented mount option to enable attribs?

Yes. 

Support for inode attributes was introduced between 2.4.18 and
2.4.19. Take latest reiserfsprogs from ftp.namesys.com, run
/sbin/reiserfsck --clean-attributes /your-device, and after that
finishes mount with -attrs option.

 > 
 > -- 
 > Tom Vier <tmv@comcast.net>
 > DSA Key ID 0xE6CB97DA

Nikita.
