From: Anders Widman <andewid@tnonline.net>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 00:19:37 +0100
Message-ID: <9744137687.20030312001937@tnonline.net>
References: <1047400482.8215.312.camel@tiny.suse.com>
 <20030311194205.A4493@namesys.com>  <1047403968.8219.337.camel@tiny.suse.com>
 <3E6E584D.4080809@namesys.com> <1047421551.8219.448.camel@tiny.suse.com>
 <6241720265.20030311233919@tnonline.net> <3E6E6928.80203@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6E6928.80203@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

>>Would  it not be possible to have a daemon running and collecting data
>>on   how   files  are  being  accessed  and  written.  Then  either  a
>>defragmenter or the fs itself can optimize the on-disk layout?
>>
> 
> There is an excellent Usenix paper on this that Nikita found, Nikita can 
> you find it again?
> 
> I would love to have that approach built into reiser4, I think it would 
> kick the butt of any other approach.

>>
>>Also,  would  it  be  possible  to  implement  some  form  of  command
>>reordering  in  the  fs? It might increase performance where there are
>>multiple accesses to smaller files on the same volume...
>>
> Can you define where that is better than letting the disk driver do the
> reordering?  (I am not saying yes or no, it is a genuine question.)

1) Not  all device drivers have command queuing and reordering. Mainly
   on  IDE  systems there is little support for TCQ - At least at this
   moment.  Also,  there  might  be cases where users run over devices
   other  than hard drives or on logical volumes such as MD or LVM. If
   writing and reading operations were aware of the physical layout of
   a  spanned volume, then speed under multi user environment could be
   considerably enhanced.
   
2) The  disk  driver  has  no  knowledge  of  the above filesystem and
   its  files.  In  case  of several concurrent writes of lots smaller
   files  the  fs  could  allow for caching them and write them out in
   sequence instead of parallel. Space might be more efficiently used,
   and  fragments avoided to some extent. It could perhaps be combined
   with the usage logging deamon suggested in earlier mail.

Maybe I am totally off here :)
   
//Anders

   
--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

