From: Guilherme Salgado <e.meiu@uol.com.br>
Subject: Re: Strange Syslog messages
Date: Mon, 16 Sep 2002 20:59:05 -0300
Message-ID: <20020916205905.1d84268c.e.meiu@uol.com.br>
References: <MSGID_2=3a263=2f950_ed7e4e2d@fidonet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <MSGID_2=3a263=2f950_ed7e4e2d@fidonet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi, 

Try running badblocks -o badblocks.hdxx /dev/hdxx (if u have ide
harddisks).
i received some messages like yours and discovered that my ide hd has some
bad blocks.

On Tuesday, 17 Sep 2002 00:09:48 +0000
"Sean Rima" <fido@tcob1.net> wrote:

> Originally to: All
> 
> Hi, me again folks,
> 
> I am using a stock 2.4.19 kernel, on a system with reiserfs only. I have
> started getting a lot of:
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
> data of [21003 21048 0x0 SD]
> is_leaf: wrong item type for item *3.5*[21003 21047 0x1 IND], item_len
> 8, item_location 2214, free_space(entry_count) 0 vs-5150: search_by_key:
> invalid format found in block 16616. Fsck? vs-13070:
> reiserfs_read_inode2: i/o failure occurred trying to find stat data of
> [21003 21048 0x0 SD]
> 
> if I boot into a rescue disk and run reiserfsck, I get no errors at all
> to be fixed running check only
> 
> Is this serious, a problem with the HD or what??
> 

