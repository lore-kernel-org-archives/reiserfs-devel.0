From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: about crash
Date: Thu, 25 Apr 2002 18:57:36 +0300
Message-ID: <3CC82770.4050607@priocom.com>
References: <3CC8173B.8030507@priocom.com> <1061290531.20020425170549@tnonline.net> <3CC81E0F.90000@priocom.com> <1672863140.20020425173202@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:
> I ran dd with blocksize 4096, though I'm not sure this is the actual
> blocksize. Can I verify the blocksize easilly?
Possible debugreiserfs can show it...

Yes, try this.
debugreiserfs /dev/hda1 | grep ^Blocksize

> 
> Anyway. I attacked the output to this e-mail.
> 
> This is what I did:
> 
> [root@server demos]# ./lookup /dev/Server/FTPRoot 1 2 0 0
> Information: Specified item found inside the leaf 669227 at position 0.
Seems right, however root-file you sent not a valid root leaf block. It 
contains rubbish.

Try this:

debugreiserf /dev/Server/FTPRoot -B 669227

And send me out.

If you'll see your root directories (at leat lost+found), then 669227 is 
right number.


> 
> [root@server demos]# dd if=/dev/Server/FTPRoot bs=4096 skip=669226 count=1 of=/root-file
It's may be joke :) You have compressed 4096 bytes file by bz2 and it 
size at the moment 4596

