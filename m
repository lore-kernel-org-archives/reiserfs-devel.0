From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reformatting disk into 4 * reiser4 partitions
Date: Wed, 27 Jul 2011 21:02:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1107272057580.9183@trent.utfs.org>
References: <7517c61bff9e4f9a22f8ca0569f66617@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <7517c61bff9e4f9a22f8ca0569f66617@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Thu, 21 Jul 2011 at 04:05, doiggl@velocitynet.com.au wrote:
> How do I reformat this disk into say 4 * reiser4 partitions of 500gb each.

"reformat"? I think you mean "partition", no? In that case, use GNU 
parted to partition the disk in 4 parts. Then, use mkfs.reiser4 on each of 
those partitions.

> Is 500gb a size that Reiser4 will handle ok ?

I sure hope so :-)

Christian.
-- 
BOFH excuse #163:

no "any" key on keyboard
