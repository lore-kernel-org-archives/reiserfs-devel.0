From: Hans Reiser <reiser@namesys.com>
Subject: Re: Directory updates in filesystems
Date: Fri, 29 Oct 2004 14:15:32 -0700
Message-ID: <4182B2F4.2080607@namesys.com>
References: <1098955408.29128.TMDA@h34.zynet2.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1098955408.29128.TMDA@h34.zynet2.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simon Waters <simonw@zynet.net>
Cc: reiserfs-list@namesys.com

Simon Waters wrote:

>There is discussion on maildir happening in the dovecot mailing list.
>
>My question is mostly curiosity driven as I thought I understood "enough" 
>about filesystems to answer such questions, and not reiserfs specific (but I 
>know it is dear to your hearts).
>
>The discussion focuses on the use of renaming files to add attributes to the 
>end of the filename.
>
>If you have multiple processes simultaneously accessing a directory with 
>rename of contents (additions and removals add more fun), a simple 
>opendir/readir loop will on occasion fail to find a file that exists (i.e. 
>the stem part of the file name is the same) because the file has been 
>renamed, on most filesystems on most *nix like systems tested.
>
>This seems to be a result of readdir without locks not being atomic on most 
>filesystems, but reading a set amount of directory entries then rereading 
>further at a later stage.
>
>AIUI BSD FFS is suppose to try and ensure that new records are added to the 
>end of list the pointer points to, so that at worst a file is seen twice, but 
>this doesn't seem to completely address the problem when testing the most 
>general case.
>
>Are there any file systems that fully address this issue
>
I think no.  It is quite fixable in a variety of ways.  If someone wants 
to fix it or have it fixed, let me know.

> or POSIX calls that 
>guaranteed to make an atomic readdir, without specific locking, or must a 
>lock be obtained on the directory to ensure that the read is consistent. I 
>think that locking is needed in the application if complete consistency is 
>required because the underlying behaviour of the OSes/filesystems is so 
>variable in this regard, but I'd be interested in understanding what 
>characteristics a filesystem would have to have to avoid this.
>
>I think a lock and full read will have significant performance implications, 
>since the problem only manifests itself on busy directories, but in a 
>journalled metadata environment all it wants is a consistent read, if we 
>later stat the file and it is missing we can look for renamed versions.
>
>Of course in a real filesystem you'd just store the attributes in something 
>designed for storing custom attributes..... :)
>
>
>  
>

