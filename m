From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 and 2.5.60
Date: Tue, 18 Feb 2003 12:12:57 +0300
Message-ID: <20030218121257.A27125@namesys.com>
References: <20030215160033.A3570@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030215160033.A3570@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Feb 15, 2003 at 04:00:33PM +0100, Ookhoi wrote:

> I still get a Segmentation fault when I want to untar a kernel source on
> a fresh 512MB loop filesystem.
> Does this help you?

Kind of.
It seems that inode_file_plugin(inode)->key_by_inode pointer is zero for one of inodes.
But I do not see how that can happen at all.
I personally untarred (and then compiled) kernel on this reiser4 snapshot without any
problems more than once (in fact this is on of my basic tests). I tried bot UP and SMP,
block device and loop device with file.  Can you describe your system in more details?

Bye,
    Oleg  
