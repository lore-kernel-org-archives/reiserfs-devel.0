From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Thu, 15 Apr 2004 07:37:28 -0400
Message-ID: <1082029047.27614.112.camel@watt.suse.com>
References: <1081274618.30828.30.camel@watt.suse.com>
	 <1081989006.27614.110.camel@watt.suse.com>  <874qrmkl43.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qrmkl43.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Wed, 2004-04-14 at 22:53, Hubert Chan wrote:
> On 2.6.5, it still fails:
> 
> ...
>   CC      fs/reiserfs/bitmap.o
> In file included from fs/reiserfs/bitmap.c:8:
> include/linux/reiserfs_fs.h: In function `reiserfs_transaction_running':
> include/linux/reiserfs_fs.h:1752: error: structure has no member named `journal_info'

This is from the reiser4 patch, it will get fixed when namesys updates
to the latest kernel trees.

-chris


