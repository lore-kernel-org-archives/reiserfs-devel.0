From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug with fsck.reiser4 build-fs - Hangs at 100%
Date: Sun, 7 Nov 2004 15:14:50 +0300
Message-ID: <200411071514.50082.vitaly@namesys.com>
References: <Pine.LNX.4.51.0411052339130.5646@leandra.the-lab.virtadpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.51.0411052339130.5646@leandra.the-lab.virtadpt.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Wolf <julia@virtadpt.net>, reiserfs-list@namesys.com

Hello

On Saturday 06 November 2004 09:32, Julia Wolf wrote:
>   So, I've been tring to rsync some files onto this other 250G Reiser4
> filesystem, and now that the filesystem is mostly full, and I'm tring to
> write a large (few hundred meg) file to it.. the machine locks up (same as
> in the last message I send) After rebooting a few times, and retrying a
> few times, I start getting I/O errors reading a certain directory. I
> notice this repeated over and over and over again in the system logs:
>
> reiser4[rsync(5765)]: key_warning
> (fs/reiser4/plugin/object.c:97)[nikita-717]: WARNING: Error for inode
> 185647 (-5)
> reiser4[rsync(5765)]: renew_sibling_link
> (fs/eiser4/tree_walk.c:441)[nikita-3532]: WARNING: Sibling nodes on the
> different levels: 1 != 2
>
>
>   Unmounting the fs and running "fsck.reiser4 /dev/sda" tells me to re-run
> with the --build-fs option. So, yesterday I ran "fsck.reiser4 --build-fs
> /dev/sda" and this is what is on the screen now:
>
> LOOKING FOR UNCONNECTED NODES
>         Read nodes 12797
>         Good nodes 45
>                 Leaves of them 44, Twigs of them 1
>         Time interval: Fri Nov  5 01:54:40 2004 - Fri Nov  5 01:54:41 2004
> CHECKING EXTENT REGIONS.
>         Read twigs 1
>         Time interval: Fri Nov  5 01:54:41 2004 - Fri Nov  5 01:54:41 2004
> INSERTING UNCONNECTED NODES
> 1. Twigs: done
> 2. Twigs by item: done
> 3. Leaves: done
> 4. Leaves by item: done
>         Twigs: read 1, inserted 1, by item 0, empty 0
>         Leaves: read 44, inserted 44, by item 0
>         Time interval: Fri Nov  5 01:54:47 2004 - Fri Nov  5 01:54:47 2004
> CHECKING SEMANTIC TREE
> FSCK: No 'lost+found' entry found. Building a new object with the key
> 2a:0:ffff. FSCK: Failed to recognize the plugin for the directory
> [2a:0:ffff]. FSCK: Trying to recover the directory [2a:0:ffff] with the
> defaut
> plugin--dir40
> FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new
> one. Plugin dir40
> FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one.
> Plugin (dir40).
> FSCK: Node (48493133), item (0), [2a:0:ffff] (stat40): wrong size (0),
> Fixed to (1).
> FSCK: Node (48493133), item (0), [2a:0:ffff] (stat40): wrong bytes (0),
> Fixed to (50).
> [==================================================-] 100%
>
> ... and that's where it's been for the last 1158 minutes. Or at least
> that's how much CPU time ps says has been used. The load average has been
> 1.00 the entire time, and nothing else (not even sshd or syslog) is
> running on the system right now.
>
>   I've just run badblocks on /dev/sda and it reported no errors.

what version of reiser4progs are you using? the latest is 1.0.2, try 
it please if you have not yet. if you get the same result, would you 
pack fs metadata with 
	debugfs.reiser4 -P device | bzip2 -c > device.bz2
and provide it for downloading?

-- 
Thanks,
Vitaly Fertman


