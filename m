From: "darren" <teodarren@myrealbox.com>
Subject: RE: OT: simple file operations in C
Date: Mon, 10 Mar 2003 21:57:39 +0800
Message-ID: <002301c2e70d$0387d5a0$0101a8c0@bummer>
References: <3E6C1673.709@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6C1673.709@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Manuel Krause' <manuelkrause@netscape.net>
Cc: 'reiserfs-list' <reiserfs-list@namesys.com>

Hi all and Manuel,

Sorry my mail was sent multiple times (that's what happens when you use
the http version of myrealbox sometimes).

Anyway, for the newbies who may have the same problem as me:

File operations:

Move: rename
Delete: Unlink
Copy: no choice...must open read write close.

I am just curious, but will the link command work for a file copy?

Regards
Darren

-----Original Message-----
From: Manuel Krause [mailto:manuelkrause@netscape.net] 
Sent: Monday, March 10, 2003 12:37 PM
To: darren
Cc: reiserfs-list
Subject: Re: OT: simple file operations in C

On 03/10/2003 04:33 AM, darren wrote:
> Hi all,
> 
> Sorry for being slightly off-topic.
> 
> I want my program to be able copy, move and delete files, but i cannot
seem to find any available functions or system calls to do this.
> 
> I don't really want to use shell by invoking "exec("mv XX YYY");, and
i also do not want to fopen 2 files and then do multiple freads and
fwrites.
> 
> Any suggestions?

If you will never send your original mail once again someone may answer 
-- otherways you are definitely SPAMMING!!! and you should be excluded.

Manuel


