From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: minor and major locality of key in reiser4
Date: Tue, 28 Dec 2004 19:18:14 +0300
Message-ID: <1104250694.4673.27.camel@tribesman.namesys.com>
References: <20041228115957.56981.qmail@web60109.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041228115957.56981.qmail@web60109.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi Dalya <pallavidalya@yahoo.com>
Cc: reiser-list mailing <reiserfs-list@namesys.com>

Hello

On Tue, 2004-12-28 at 14:59, Pallavi Dalya wrote:
> hello,
>  
> While reading a file we give the name of the file. The semantic layer
> converts the name into key. The directory plugin item contains the key
> for the file (which we call a common part). This key is then
> manipulated by the storage layer to reach the actual offset we want to
> read and we get the data.
>  
> But how does the sematic layer converts the name in the key.

Sorry, I do not understand what do you mean by "semantic layer".

>  I found out that the semantic layer makes use of graph and not a
> tree. But in order to use the graph  atleast the "/" address has to be
> stored somewhere. In which structure (e.g inode,superblock,..etc) is
> the address stored. Also the semantic layer is the graph that means it
> does not make use of the actual tree to find the key from the file
> name .Again the key for a file is stored in directory pluign or
> directory item which is stored in the tree.

Plugin is a set of function. Item is data which can be found in reiser4
tree if its key is known.

>  That means the semantic layer has to traverse the tree to get the
> key. but how can it traverse the tree without a key .This is rather
> confusing.

It traverses with key.

>  
> Basically i want to know what actually the semantic layer does to
> convert a filename into a key.

please take a look at fs/reiser4/kassign.h:build_entry_key_common()
this function is used to calculate a key of directory entry if objectid
of directory to look through and file name are known.

>  
> Regards,
> Pallavi
> 
> 
> ______________________________________________________________________
>  Yahoo! Messenger - Communicate instantly..."Ping" your friends today!
> Download Messenger Now

