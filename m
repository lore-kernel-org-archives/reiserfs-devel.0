From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Block corruption
Date: Tue, 08 Jun 2004 19:55:45 +0400
Message-ID: <1086710145.1830.106.camel@tribesman.namesys.com>
References: <s0c5e9fc.070@allshare.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <s0c5e9fc.070@allshare.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Snare <asnare@allshare.nl>
Cc: Paul Wagland <PWagland@allshare.nl>, reiserfs-list@namesys.com

Hello

On Tue, 2004-06-08 at 18:31, Andrew Snare wrote:
> Vladimir Saveliev suggested:
> > Well, reiserfs needs to include device name into its warnings
> > Until it is not done you might want to do
> > 
> > find /mountpoint -inum 52653 
> > for each of your reiserfs filesystem.
> 
> That number comes from the vs-13070 messages. They're of the form:
> > vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to
> > find stat data of [52570 52653 0x0 SD]
> 
> What are these numbers near the end? You've referred to the second as
> the inode, but we'd like to understand more clearly what's going on.
> 
reiserfs builds files of items. Item is stored in an ondisk tree. Each
file has at least one item - stat data item. Each item has key. Key has
4 components.
[52570 52653 0x0 SD] is key of stat data. Key of stat data was taken
from directory entry.
First key component is unique identifier of directory in which file was
created.
Second key component is unique identifier of file itself. This is what
is reported in st_ino field of struct stat
Third key component is offset within a file. It is 0 for items if stat
data type.
Fourth key component is item type.


> Cheers,
> 
>  - Andrew
> 

