From: Sander <sander@humilis.net>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 11:38:12 +0100
Message-ID: <20051122103812.GB12072@favonius>
References: <200511171447.41362.mail@earthworm.de> <200511221123.51724.marcel@hilzinger.hu>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200511221123.51724.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Marcel Hilzinger wrote (ao):
> Did you ever think about, that this is not a reiser4 problem, but a
> kernel bug or a problem related to hal? 
> 
> Suse 10 has big problems with external USB drives using sync as mount
> option. They used sync already in 9.3 but with 2.6.11 there were no
> such problems. There has been some changes in kernel 2.6.13 and 2.6.14
> concering the sync behavior, perhaps it can help investigating there
> first, bevor fixing reiser4 for nothing...

Running Debian here, and all the reports have been on Reiser4
filesystems. Also, the same system has no such problems with other
filesystems.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
