From: Quinn Harris <lists@qutek.net>
Subject: Re: a bit OT: traditional Unix filesystems
Date: Thu, 14 Sep 2006 13:43:39 -0600
Message-ID: <200609141343.49379.lists@qutek.net>
References: <20060914170544.GA7793@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060914170544.GA7793@tranquility.scriptkitchen.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Payal Rathod <payal-fs@scriptkitchen.com>

Payal

All file operations pass through the linux VFS (virtual file system).  When a 
process requests a file operation, the kernel VFS code will traverse the tree 
of dentries starting at the root or current working directory dentry.  If it 
hits a point where there is no dentry, VFS will ask the file system to 
produce one with info that file system needs to relate the dentry to the data 
on the file system (usually includes reference to the inode).  So if we 
open("/tmp/paypal.txt") the vfs will look for a 'tmp' dentry that is a child 
of the root dentry.  Then look for a 'paypat.txt' dentry.  From that, VFS 
will call the file system to open the file for the specified dentry.

When you mount a file system, VFS will find the dentry associated with the 
directory you are mounting the new fs at.  Then get a dentry for the root of 
the new file system.  Then essentially swap them out.  So when the VFS 
traverses the dentries it will traverse right onto the dentry for the other 
file system.  That isn't really correct, there is a bump through a vfsmount 
structure, but that's the basic theme.  
Namespaces allowing different process to see different view of the file 
system also complicate the matter a bit.

Try googling "linux vfs"

If you really want to know "exactly" how it works, look at the code.  
Documentation/filesystems/vfs.txt 
include/linux/dcache.h include/linux/mount.h include/linux/fs.h fs/namei.c 
fs/namespaces.c are some places to start.  



On Thursday 14 September 2006 11:05, Payal Rathod wrote:
> Hi,
> I have a small OT query on working of traditional filesystem of Unix.
> Can someone comment/correct me on the query below?
>
> If i type $ cat /tmp/payal.txt (according to my knowledge) inode of / is
> found out (2) from super-block. From there physical location of "/" is
> read (i.e. the directory entry) and from there inode of tmp is found
> out. Then directory entry of tmp is read and inode of payal.txt is found
> out and then data blocks of that file are read.
> Am I correct in this?
>
> Now if tmp is on different partition or harddisk, how will directory
> entry of "?" point it out exactly? As far as I know, directory entry
> contains names and inode number and not the device details, then how
> does it exactly work? I googled a lot for it, but didn't find exact
> answer. Can someone please explain?
>
> With warm regards,
> -Payal

