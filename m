From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiserfsck --rebuild-tree rendered machine unbootable.
Date: Thu, 16 Sep 2004 10:33:54 +0400
Message-ID: <1095316434.1359.304.camel@tribesman.namesys.com>
References: <20040915224812.M91258@mrbrklyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915224812.M91258@mrbrklyn.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: slavik914@mrbrklyn.com
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-09-16 at 03:53, Steve Milo wrote:
> Hello, I was trying to erase some files in /var/run/sysconfig and
> /var/run/smpppd on my Suse 9.1 box.  Logged in as root I would get 'permission
> denied' when 'ls -l' or 'rm -f'.
> I figured perhaps the filesystem had become corrupted somehow so I decided to
> do  a reiserfsck --rebuild-sb.  That didnt fix what I persumed was a
> permissions issue.
> I then ran a reiserfsck --rebuild-tree and it found quiet a few problems and
> appeared to have fixed them.  I decided to reboot and found that my machine
> was rendered unbootable.  It goes into grub and I can get a grub prompt but I
> receive 'hd(0,0) wrong filesystem' or something to that effect.
> I did not make a backup copy of my filesystem like I should have, I figured I
> could get away with not doing so.  I guess I was wrong.
> 
> Any help in this matter would be appreciated.
> 

Did you try to boot of Suse 9,1 disk and to recover?

> Thanks,
> Steve M
> 
> --
> Open WebMail Project (http://openwebmail.org)
> 
> 

