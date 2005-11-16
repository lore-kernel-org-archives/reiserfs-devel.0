From: Sander <sander@humilis.net>
Subject: Re: reiserfsck --rebuild-tree failure
Date: Wed, 16 Nov 2005 18:37:55 +0100
Message-ID: <20051116173755.GA7915@favonius>
References: <437B6C0F.8040604@zabuchy.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <437B6C0F.8040604@zabuchy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iv <iv@zabuchy.net>
Cc: reiserfs-list@namesys.com

iv wrote (ao):
> obvious, there are badblocks: badblocks.log.
> i still can read from damaged partition. when i run `strings /dev/hdc3`
> i get plently of text.
> the question is if there is a way to mount the partition.

dd_rescue the whole partition to another disk and reiserfsck the
resulting image.

After that, mount the image and see what is left.

Hope this helps, kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
