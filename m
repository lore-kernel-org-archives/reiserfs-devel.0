From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Prereading block device doesn't help filesystems
Date: Tue, 3 Jun 2003 10:49:35 -0700
Message-ID: <20030603174935.GA4044@matchmail.com>
References: <E19L7Co-0002Sb-00@rode.parc.com> <20030529054511.GA30925@namesys.com> <3EDB9910.7040005@namesys.com> <1054584035.21053.65.camel@rode> <20030603053336.GC8667@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030603053336.GC8667@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Jeff Breidenbach <jbreiden@parc.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Tue, Jun 03, 2003 at 09:33:36AM +0400, Oleg Drokin wrote:
> (e.g. dd if=/dev/hdb1 /dev/zero bs=1024k count=500 (replace 500 with the half of your RAM
> in megabytes) and you have large enough RAM, there is a chance that this will cache
> enough data to keep stuff moving more quickly. 

That won't work either.

Basically you're copying the data into buffer cache, and the page cache
won't be able to pick it up, so you're going to read from the disk twice.
Even with Andrea's buffercache in pagecache from 2.4.10 it doesn't do the
aliasing IIRC.  And there were some long threads where Linus said he
wouldn't accept patches to do the aliasing either.

Don't know if he has changed his mind in 2.5 though...
