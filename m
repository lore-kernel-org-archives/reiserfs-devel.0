From: Oleg Drokin <green@namesys.com>
Subject: Re: Strange Syslog messages
Date: Tue, 17 Sep 2002 10:14:49 +0400
Message-ID: <20020917101449.A30035@namesys.com>
References: <MSGID_2=3a263=2f950_ed7e4e2d@fidonet.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <MSGID_2=3a263=2f950_ed7e4e2d@fidonet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Rima <fido@tcob1.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Sep 17, 2002 at 12:09:48AM +0000, Sean Rima wrote:

> I am using a stock 2.4.19 kernel, on a system with reiserfs only. I have started 
> getting a lot of:
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of 
> [21003 21048 0x0 SD]
> is_leaf: wrong item type for item *3.5*[21003 21047 0x1 IND], item_len 8, 
> item_location 2214, free_space(entry_count) 0 vs-5150: search_by_key: invalid 
> format found in block 16616. Fsck? vs-13070: reiserfs_read_inode2: i/o failure 
> occurred trying to find stat data of [21003 21048 0x0 SD]

Do you see any other messages from kernel at this same time?

> if I boot into a rescue disk and run reiserfsck, I get no errors at all to be 
> fixed running check only

What reiserfsprogs version do you have?

> Is this serious, a problem with the HD or what??

Hard to tell right now.

Bye,
    Oleg
