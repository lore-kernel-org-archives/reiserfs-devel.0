From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reading data blocks in reiser4
Date: Fri, 24 Dec 2004 18:23:29 +0300
Message-ID: <1103901808.21434.48.camel@tribesman.namesys.com>
References: <20041223135134.64223.qmail@web60109.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041223135134.64223.qmail@web60109.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi Dalya <pallavidalya@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-12-23 at 16:51, Pallavi Dalya wrote:
> hello,
>  what are the internal operations to read a file in reiser4 ..
> i understand that the semantic layer converts the name into key of an
> object(this key is received from the directory entry) and the storage
> layer searches for the node in the tree. also all the data of the file
> is stored in the unformatted leaf and only the tails of the files is
> stored in the items (the tail policy plugins).  

no. default file in reiser4 is either stored in unformatted
nodes or in tail items. Tail policy plugin is used to choose how to
store files.

> Also the key leads us to the stat data of a file for accessing the
> permission of the file and it gives us the offset of the actual
> data...

File is represented by items. All items have a key. All keys of items
representing a file have common part. When you know that common part -
you can compose a key of any position in a file as well as key of stat
data. Then you search in the tree for whatever is needed.

> is this offset a address of the node where the files direct and
> indirect data is stored ?
> 
With key you find an item and position in it. This item may contain data
you were looking for or contain a pointer to unformatted node containing
those data. 


> what role does a inode play in the complete process?

I guess you are about in-core inode? It is used to communicate with
linux VFS.

>  
> Pallavi
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam? Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com 

