From: Chris Mason <mason@suse.com>
Subject: Re: clm-6005
Date: 15 Apr 2002 09:16:00 -0400
Message-ID: <1018876560.28340.165.camel@tiny>
References: <20020415013629.GA13011@nikolas.hn.org> 
	<20020415092354.B1116@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020415092354.B1116@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Nick Orlov <nick.orlov@mail.ru>, reiserfs-list@namesys.com

On Mon, 2002-04-15 at 01:23, Oleg Drokin wrote:
> Hello!
> 
> On Sun, Apr 14, 2002 at 09:36:29PM -0400, Nick Orlov wrote:
> 
> > two days ago I have made a decision to make /usr readonly and remount it
> > rw only for upgrades (my /usr is on reiserfs).
> > today I have found next messages in my kern.log:
> > Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275524 on
> > readonly FS
> > Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275475 on
> > readonly FS
> > Apr 14 13:44:06 nikolas kernel: clm-6005: writing inode 82746 on
> > readonly FS
> > ....and so on....
> 
> Hm. I am not sure of the cause yet, may be this is atime is tried to be updated
> on previously open files or something like that.
> Useless/strange warnings should go away for sure.
> I will come with the patch once I figure where the problem lies.

Lets start by finding out what files those inode numbers correspond to. 
Could you please do a find /usr -inum 82746 (and for each of the other
inodes numbers listed), then do an ls -la on that file and send us the
output?

Is /usr mounted readonly from /etc/fstab, or is it mounted rw first, and
then remounted to readonly?

-chris




