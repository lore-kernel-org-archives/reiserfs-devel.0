From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: file as a directory
Date: Mon, 20 Dec 2004 22:40:10 -0500 EST
Message-ID: <2738999945-BeMail@cr593174-a>
References: <41C70A1F.8000609@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C70A1F.8000609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote on Mon, 20 Dec 2004 09:21:35 -0800:
> Ok, go talk to the befs driver guy, and you'll find out he has already 
> done work on it.

I just did some work in making a test file system with hard links and
bidirectional references (files know which directories (plural) they are in).
It uses a simple graph traversal upon delete to do garbage collection.
Compared to the sophisticated garbage collection algorithms I was reading
about at university a decade ago, it's nothing worth writing a paper about!
But still, there was enough new stuff to make it worth writing a text file:
http://web.ncf.ca/au829/BeOS/AGMSLinkExplanation.txt

And if you want, you can read the excessively commented source code,
including a large passage explaining the delete/rename algorithm, at:
http://web.ncf.ca/au829/BeOS/AGMSRAMFileSystem20040403.zip

Horst wrote:
>> Everthing stuff that works on the assumption that what they are working
>> on fits in RAM (or can overflow into swap space in a pinch), [...]

Admittedly my experiment was for a RAM disk.  It can be extended to a real
disk if the number of inodes in a graph traversal can fit into memory (or
otherwise can somehow be locked).  If that doesn't work, then the user
would have to delete individual files before removing a directory cycle.

- Alex
