From: Yury Umanets <torque@ukrpost.net>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 14:00:25 +0300
Message-ID: <413065C9.3000404@ukrpost.net>
References: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com> <1093521627.9004.23.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093521627.9004.23.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Christophe Saout wrote:

>Am Donnerstag, den 26.08.2004, 07:42 -0400 schrieb Rik van Riel:
>
>  
>
>>>>I like cat < a > b. You can keep your progress.
>>>>        
>>>>
>>>cat <a >b does not preserve following file properties even on standard
>>>UNIX filesystems: name,owner,group,permissions.
>>>      
>>>
>>Losing permissions is one thing.  Annoying, mostly.
>>
>>However, actual losing file data during such a copy is
>>nothing short of a disaster, IMHO.  
>>
>>In my opinion we shouldn't merge file-as-a-directory
>>semantics into the kernel until we figure out how to
>>fix the backup/restore problem and keep standard unix
>>utilities work.
>>    
>>
>
>Well, again, what about xattrs and ACLs...?
>
>Actually, reiser4 doesn't currently implement storage of arbitrary user
>data under a file.
>
>It's just some sysfs-like information that can be retrieved, some
>properties can be changed. If you copy a file the worst thing that can
>happen right now is that you lose the information whether that file
>should be encrypted or compressed. You don't lose data.
>
>In case some people are wondering, this is what you can find in the
>reiser4 metas:
>
>leto:/home/chtephan/.muttrc/metas > la
>insgesamt 1
>dr-xr-xr-x  1 chtephan users   0 26. Aug 13:52 .
>-rwx------  1 chtephan users 290 12. Jan 2004  ..
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 bmap
>-rw-r--r--  1 chtephan users   0 26. Aug 13:52 gid
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 items
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 key
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 locality
>--w-------  1 chtephan users   0 26. Aug 13:52 new
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 nlink
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 oid
>dr-xr-xr-x  1 chtephan users   0 26. Aug 13:52 plugin
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 pseudo
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 readdir
>-rw-r--r--  1 chtephan users   0 26. Aug 13:52 rwx
>-r--r--r--  1 chtephan users   0 26. Aug 13:52 size
>-rw-r--r--  1 chtephan users   0 26. Aug 13:52 uid
>
>Some of them are reiser4 specific things (items, key, locality, oid)
>which can only be queried anyway.
>
>The rest is what you can also get using other VFS calls.
>
>leto:/home/chtephan/.muttrc/metas/plugin > la
>insgesamt 0
>dr-xr-xr-x  1 chtephan users 0 26. Aug 13:52 .
>dr-xr-xr-x  1 chtephan users 0 26. Aug 13:52 ..
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 compression
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 crypto
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 digest
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 dir
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 dir_item
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 fibration
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 file
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 formatting
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 hash
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 perm
>-rwxr-xr-x  1 chtephan users 0 26. Aug 13:54 sd
>
>Here you can change reiser4 specific things. Here you can change some
>properties how the file is stored in the reiser4 tree. For example you
>can activate compression, encryption or authentication or set some hints
>to optimize speed.
>  
>
I suppose that you are talking about the prinsiple ability to change 
these things. Because in real life it will also need some kind of 
convertion from one look (say with old plugin) to another one. Just like 
tail conversion rebuilds file's body after tail policy plugin gets changed.





-- 
umka

