From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Using filename-hash as part of key
Date: Mon, 23 Dec 2002 14:52:23 +0300
Message-ID: <15878.63735.448875.70027@laputa.namesys.com>
References: <20021223141641.B31759@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021223141641.B31759@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Oleg Drokin writes:
 > Hello!
 > 
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

Can you clarify this? Hash of a file name is already used as a part of
directory entry key (and has always been from the earliest versions of
reiserfs, as far as I know).

If you are talking about using hash as part of a key of file *body*
and/or stat-data this also has been discussed many times for reiserfs
v3. I generally think this is easy enough to try without a lot of
discussion, thanks to decision to concentrate all key assignment
decisions in one place (kassign.c). One point: probably we want to embed
into key part of file name rather than hash.

 >    That would allow us to allocate blocks for files in right order (only
 >    true for reiesr4 where we have delayed allocation).
 > 
 >    Obvious disadvantages are: larger keys mean more fs overhead,

If we restrict ourselves to only optimizing layout of stat-data (rather
than file bodies), current key size would suffice, because now offset
field of stat-data's key is unused.

 >    this optimisation won't work if file gets renamed later, if this directory
 >    is never read in sequentional order.
 > 
 >    But as Hans argues, usually these sequentional-read operations are ones most
 >    noticed because they are usually performed by humans:
 >    ls, tar, copy of a directory and this kind of stuff.

Humans are so slow compared to the slowest hard drive that ls is the
least important thing to optimize.

 > 
 >    Now let's listen to all the different opinions on this plan, your comments
 >    are welcome.
 > 
 > Bye,
 >     Oleg

Nikita.
