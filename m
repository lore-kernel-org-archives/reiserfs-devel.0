From: Hans Reiser <reiser@namesys.com>
Subject: Re: OT: simple file operations in C
Date: Mon, 10 Mar 2003 15:20:11 +0300
Message-ID: <3E6C82FB.4040909@namesys.com>
References: <1047267201.c3ecdd60teodarren@myrealbox.com> <3E6C1673.709@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13168-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6C1673.709@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Manuel Krause <manuelkrause@netscape.net>
Cc: darren <teodarren@myrealbox.com>, reiserfs-list <reiserfs-list@namesys.com>

On 03/10/2003 04:33 AM, darren wrote:

> Hi all,
>
> Sorry for being slightly off-topic.
>
> I want my program to be able copy, move and delete files, but i cannot 
> seem to find any available functions or system calls to do this.
>
> I don't really want to use shell by invoking "exec("mv XX YYY");, and 
> i also do not want to fopen 2 files and then do multiple freads and 
> fwrites.
>
> Any suggestions?


Unlink and rename will delete and remove, but copying you cannot do in 
Unix in a single system call until we release sys_reiser4()

-- 
Hans


