From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reading data disk blocks of a file
Date: Wed, 22 Dec 2004 19:40:01 +0300
Message-ID: <1103733601.3232.79.camel@tribesman.namesys.com>
References: <5fe093a5041222073823cdef43@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5fe093a5041222073823cdef43@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi <pallavidalya@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-12-22 at 18:38, Pallavi wrote:
> hello,
> what are the internal operations to real a file..I understand that the
> semantic layer
> converts a filename into a key but where in the source code is the
> implementation of this semantic layer found and how does it exactly
> convert the name to a key?
> 
Having key of directory and name in it to look for you compose key of
directory entry and search with that key through filesystem tree. If
entry is found - you get key of file found entry points to.


> A key will lead me to a node. That node had range of keys each
> corresponding to an item.The key I get will point to an item. Let's
> say the item contains data, but given that the item size is limited
> the data may be spread  across items nodes.

If file data are spread across several nodes - there will be several
items. Keys of those items are different.

>  How are all the data
> blocks where data from particular file is stored identified.
> Basically i want to know how are all the data blocks of a file are
> accessed and read?
> 

reiserfs may store file data either in data blocks or in formatted
nodes.
To read data stored in data blocks you have to find number of block
where data you need are stored at. reiserfs stores those block numbers
in items which can be found by key. Once you have a number of block -
you have to read it to reach file data.

When file data stored in formatted node - you also make a key of
position in a file and search through the tree. Found item contains data
you looked for.

