From: Anders Widman <andewid@tnonline.net>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 16:53:58 +0200
Message-ID: <881620305.20030428165358@tnonline.net>
References: <3EAD34D5.8030108@solidcode.net>
 <20030428143231.GA11226@namesys.com>
 <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Mon, 28 Apr 2003 18:32:31 +0400, Oleg Drokin said:

>> How about such a generic solution:
>> 
>> you create /incoming/.temp (or /incoming.tmp), all the files are being writte
> n
>> there. When write is complete, you just do rename(2) from tempdir to /incomin
> g

> Oleg:  A very good solution, except there are chucklehead admins at the
> remote site that refuse to make changes to their end, and this solution
> would require a change at the remote end to do a FTP rename.. ;)


   Which  still  should  be  less  expencive  than having to resort to
   making  custom programs on your side. Use money as argument.. Works
   most of the time ;)

   //Anders


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

