From: Anders Widman <andewid@tnonline.net>
Subject: Re: Using filename-hash as part of key
Date: Mon, 23 Dec 2002 12:27:52 +0100
Message-ID: <175250941609.20021223122752@tnonline.net>
References: <20021223141641.B31759@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021223141641.B31759@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello!

>    We had a discussion with Hans on read performance now.
>    As everybody probably already knows, reiserfs (v3 and v4) is 
>    very sensitive to order in which you write files to it if you
>    want to read these files back quick. (actually this issue is the same
>    with anything that uses filename hashes to quickly navigate through
>    directories). In order to achieve best results you need to write
>    files in the same order as hashes of their names would appear in directory.
>    We refer to this order as "read optimised" ;)
>    Of course writing files in read-optimised order is not always possible,
>    so the idea is to use hash of file name as part of the key.
>    That would allow us to allocate blocks for files in right order (only
>    true for reiesr4 where we have delayed allocation).

>    Obvious disadvantages are: larger keys mean more fs overhead,
>    this optimisation won't work if file gets renamed later, if this directory
>    is never read in sequentional order.

>    But as Hans argues, usually these sequentional-read operations are ones most
>    noticed because they are usually performed by humans:
>    ls, tar, copy of a directory and this kind of stuff.

True..  the  perception  of  performance  is  at least as important as
"real" performance.

If  read-optimized  writes  are  not possible, then maybe a utility to
optimize  the  read/file  listing  performance would be beneficial. It
could either be run as a cron job, or manually.

// Anders

>    Now let's listen to all the different opinions on this plan, your comments
>    are welcome.

> Bye,
>     Oleg

