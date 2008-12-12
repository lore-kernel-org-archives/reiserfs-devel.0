From: Ralph <eulenreich@gmx.de>
Subject: Re: The reiser4 programming style is recursive?
Date: Fri, 12 Dec 2008 17:21:05 +0100
Message-ID: <ghu32e$nqp$1@ger.gmane.org>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Edward Shishkin Thursday 11 December 2008 23:56:
>> there is no reiser4 transaction manager in place with just
>> the patches, right ?
> Its code can be found in reiser4/txnmgr.c

And is this activated or not ready disabled code?

And transactions cannot be used by a normal user, because linux-vfs does not know anything about transactions and therefore there is no way to communicate a transaction command ? 

>>  And the right balancing code in place would have effects like
>>  optimizing access on hard disk, right?
>  yes
I used gentoo half a year on reiser4 and had no performance issues, but filling was not more than half. There are performance issues with more than 80% of charge and not running the balancing code so that the "dancing trees" are about to really dance?
 
>> I read about the xattr problem, traditional linux xattr is to big to
>> suit in place. This means you have to apply the reiser4-philosophy: A
>> file can have sub files (is not only a file but also a directory of
>> subfiles). Why not creating a new reiser4 specific file type just for
>> xattr.
> 
> Subfiles are impossible because of a problem on vfs level
> related to hardlink functionality. It seems not yet resolved...

Here perhaps I can disagree with you (but keep in mind I am not a kernel hacker and do know nearly as much as the filenames of the reiser4 source):

If subfiles for xattrs that would be the clean reiser4 solution (in respect of reiser4 philosophy). But it surely breaks linux-vfs doctrins: a file has to be just a file and not a directory.
And aiming fast inclusion in mainline kernel _without_ to have to have hard discussions, then a subfile solution is no go for now. 

But for now in our discussion a push aside of linux-vfs doctins: 

Isn't it easy to hide a new xattrs-subfile-plugin from linux-vfs?  
Vfs will not see them. If the reiser4 subsystem is asked about xattrs of some file then vfs will see xattrs but no subfile because of the new to create xattrs plugin (it is hiding its content, even its existence) ! 

And with such a new subfile logic for xattrs you can show the potential of reiser4. For example implementing xattr-subfiles as softlinks pointing to one little place where all xattrs of the whole partition are stored. So they can easily been cached. Performance working with xattrs would trump all other available filesystems. 

And you can give the user the most powerful command ever heard: To change the xattr of thousands of files at once !

Ralph


