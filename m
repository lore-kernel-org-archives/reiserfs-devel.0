From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs errors
Date: Tue, 9 Sep 2003 14:48:41 +0400
Message-ID: <20030909104841.GA26689@namesys.com>
References: <3F5CAFF9.9020205@zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F5CAFF9.9020205@zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 08, 2003 at 09:36:09AM -0700, Fong Vang wrote:

> Could someone tell me what these error messages mean (these messages 
> appear on the console and in /var/log/messages)?
>     Aug 30 15:49:51 fongtest kernel: is_leaf: free space seems wrong: 
> level=1, nr_items=58, free_space=12 rdkey
>     Aug 30 15:49:51 fongtest kernel: vs-5150: search_by_key: invalid 
> format found in block 15395. Fsck?

This is on-disk corruption.

> It doesn't say which device is giving this error message.

Yes, but newer kernels do this. (like 2.4.22)

> Any help would be appreciated.

Just get latest reiserfsprogs from ftp.namesys.com/pub/reiserfsprogs,
compile it and run reiserfsck on all suspected partitions.
Also it might be good idea to upgrade your kernel to e.g. 2.4.21

Bye,
    Oleg
