From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: testing/questions about latest Reiser4
Date: Mon, 05 Apr 2004 19:23:08 +0400
Message-ID: <1081178588.1162.47.camel@tribesman.namesys.com>
References: <4070E534.9010509@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4070E534.9010509@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-04-05 at 08:48, Grant Miner wrote:
> Does Reiser4 store stat data in real files, or some special way?

files are built of items. Every file has item of stat data type. So,
reiser4 stores stat data as an item.

>   Are 
> pseudo files just representation of stat data stored a special way? 

Pseudo files are not stored anywhere

>  Is 
> it possible to do streams/forks with a plugin easily?
> 
> I mounted latest Reiser4 snapshot + linux 2.6.4 with acl and xattr 
> options but when I tried "getfattr" I received "operation not supported"?
> 
reiser4 does not support xattrs. You may try to #define XATTR (1) in
fs/reiser4/reiser4.h and try to mount with -o xattr. This code was
disabled sometime ago. So, it is not guarantted to work.

> I'm using Reiser4 as root fs for some days now, and it is great!  Only 
> problem is whenever I run 'make' it always recompiles everything;

I just tried to compile reiserfsprogs, and it worked as expected. Can
you, please, say more how to reproduce this problem?

>  
> perhaps this has to do with time stamps?  Oh and fibration is cool :) 
> How do I switch to the other fibration plugins for a directory?
> 

echo -n 'ext-3\0' > ./metas/plugin/fibration


