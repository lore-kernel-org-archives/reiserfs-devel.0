From: Edward Shishkin <edward@namesys.com>
Subject: Re: Will I need to re-format my partition for using the compression
 plugin?
Date: Tue, 20 Sep 2005 17:58:44 +0400
Message-ID: <43301594.3040406@namesys.com>
References: <194f625505092006316ad200b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f625505092006316ad200b5@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linuxhippy@gmail.com
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:

>Hello again,
>
>I am currently re-installing my linux system and I would like to use
>reiser4 since I think its really powerful and great (and is well
>written too ;) ).
>
>However, will it be possible to convert a non-compressed reiser4
>partition to a compressed one withought the need of deleting data or
>reformat anything?
>
>Thanks, lg Clemens
>  
>

No need in such reformat actually. It may require special config options
to build the kernel, and maybe special mount option to mount your partition.

Edward.
