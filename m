From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: keys and inodes
Date: Sun, 04 Jul 2004 12:46:26 +0400
Message-ID: <40E7C3E2.10509@namesys.com>
References: <1088802102.6434.80.camel@murdock.llnl.gov> <40E67C3D.6070609@namesys.com> <200407031650.55869.marcelo@macp.eti.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407031650.55869.marcelo@macp.eti.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcelo Pacheco <marcelo@macp.eti.br>
Cc: reiserfs-list@namesys.com

Hello

Marcelo Pacheco wrote:
> So, inode numbers on Reiser are alocated on the fly, as files are used, and 
> those numbers will change, so for example, ls -i is useless with reiser, as 
> that number given for each file will change once the vfs structure gets 
> released and later the file gets used again ?
> 

No, once file is created ls -i will always return the same inode number 
for it.

> Just checking,
> 
> Marcelo Pacheco
> 
> On Saturday 03 July 2004 06:28, Vladimir V. Saveliev wrote:
> 
>>Hello
>>
>>jenn sirp wrote:
>>
>>>Hi,
>>>
>>>I was hoping someone might be able to answer a couple of questions about
>>>inodes is Reiser(v3).
>>>
>>>I would like to know how ReiserFS inodes and the VFS inodes in the
>>>d_cache correspond with each other.
>>
>>You might want to read about dentry-inode relationship in
>>linux/Documentation/filesystem/vfs.txt.
>>
>>  Specifically, how and where it is
>>
>>
>>>that 'keys' get mapped to inodes in the system?
>>
>>Reiserfs provides set of vfs operations. The one which is responsible
>>for mapping keys to inode is lookup method. reiserfs implementation is
>>reiserfs_lookup. It searches for the file name in filesystem tree. If
>>name is found - file key is extracted from it and VFS inode is created
>>(connected to d_cache dentry).
>>File key is stored in reiserfs specific portion of VFS inode.
>>
>>
>>>Do ReiserFS keys change or get reconstructed when tails are packed or
>>>when the tree gets re-balanced?
>>
>>No. Once file is created - its key never changes. However, each position
>>in a file has its own key. For instance, 0-th byte of a file has key X,
>>Y, 1. 100-th byte of a file should be looked for with key X, Y, 101.
>>[X, Y] is the same for any part of file. This is what is extracted from
>>file name on lookup. Key of any other position within a file can be
>>easily calculated as we saw.
>>
>>Or do keys remain consistent throughout
>>
>>
>>>a file's lifetime in the system?
>>
>>Yes.
>>
>>
>>>Even the quickest response would be greatly appreciated.
>>>
>>>Thanks,
>>>
>>>Jenn
> 
> 
> 


