From: Jean Jordaan <jean@upfrontsystems.co.za>
Subject: Re: reiserfs corruption: --rebuild-tree bug report
Date: Tue, 20 Jan 2004 17:14:20 +0200
Message-ID: <400D45CC.4070004@upfrontsystems.co.za>
References: <400D372C.5010903@upfrontsystems.co.za> <200401201603.11653.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401201603.11653.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> You didn't mention that you used the wrong commands 

OK, OK, I'm on a solid diet of crow for the next two weeks!

Still, the initial error that downed the box showed reiserfs
complaining about an inode, and the Seagate disk diagnostics
showed no hardware failure. I might not have been as good to
my filesystem as I should have been while recovering, but the
event that started this saga was the box failing to come up
because of a corrupt reiserfs.

We're running reiserfs on all our desktops here, and on many
servers at clients, and have never experienced the same thing
before.

-- 
Jean Jordaan
http://www.upfrontsystems.co.za

