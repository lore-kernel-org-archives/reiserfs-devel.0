From: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Subject: Re: 2.6.15 reiserfs bugs that cause the system to hang and increase load sistematically
Date: Fri, 27 Jan 2006 21:21:47 +0100
Message-ID: <166928002.20060127212147@dns.toxicfilms.tv>
Reply-To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello Vladimir,

Friday, January 27, 2006, 2:26:48 PM, you wrote:

> On Thu, 2006-01-26 at 21:10 +0100, Maciej Soltysiak wrote:
>> Hello!
>> 
>> I just hit a problem with reiserfs. While working this popped on the console:
>> ReiserFS: sdb2: warning: vs-13060: reiserfs_update_sd: stat data of object [2497 4756 0x0 SD] (nlink == 2) not found (pos 1)
>> ReiserFS: sdb2: warning: zam-7002:reiserfs_add_entry: "reiserfs_find_entry" has returned unexpected value (3)
>> REISERFS: panic (device sdb2): vs-7050: new entry is found, new inode == 0
>> 

> rename encountered "hidden" name when it should not be there.
> the attached patch should make reiserfs to not panic but return -EIO.
Ok, I'll apply that patch and be on the lookout for this warning.

> It would be interesting to know how did you manage to create hidden
> names.
Well on this partition hidden names could have been created either by:
a) bash, and mc with files like .bash_history, etc.. (all standard stuff)
b) courier-imap which creates directories for IMAP folders, like:
   .My Folder
   .Sent
   .Trash

For now, I have no clues about it.

> you should reiserfsck /dev/sdb2
Sure thing.

Thanks a lot.
Maciej


