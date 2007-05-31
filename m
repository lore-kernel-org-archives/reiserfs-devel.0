From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: Filesystem corruption
Date: Thu, 31 May 2007 02:11:51 +0200
Message-ID: <20070531001151.GA9933@efil.de>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com> <200705301503.15105.ninja@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200705301503.15105.ninja@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 2007-05-30 15:03, David Masover wrote:

> Only, recently, these fsck-a-thons started happening more and more often, and 
> I started to lose random files. They'd just be silently truncated to 0 bytes. 
> And not files I was writing a lot -- I'm talking about things 
> like /bin/mount.

Hm, same here. I lost /bin/sleep several times. I have a little script
printing status messages to the screen, sleeping two seconds and print
again - you name it. The probability that /bin/sleep is accessed at the
same time the system crashes is quite high (this is _no_ write access,
the system is even mounted noatime).

How could pure execution of a file cause corruption of the file itself?
Any idea ?

Apart from that single file, I never had any serious problems with
reiser4 on three busy systems for years - fsck.reiser4 works like charme.


-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

