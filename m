From: Oleg Drokin <green@namesys.com>
Subject: Re: Error message - vs-13070
Date: Fri, 14 Feb 2003 19:39:50 +0300
Message-ID: <20030214193950.A27507@namesys.com>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Heberle <heberle@westnet.com.au>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Feb 15, 2003 at 12:26:53AM +0800, Andrew Heberle wrote:

> Twice in the last four days I have found the following message in one of my 
> systems logs:
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
> data of [1718696 1718710 0x0 SD]
> I have managed to track this error back to a particular file.
> When attempting an 'ls' on the file in question I get a "Permission denied" 
> message.

What kernel is that?
Were there any other messages around this one in logs? (not necessary reiserfs
related)

> The error suggests a bad block on the hard drive where that file exists I 
> assume?

There is some I/O error (including but not limited to bad sectors, corrupted
filesystem nodes, corrupted tree consistency and so on).
The reason for it should be explained by other messages that should appear in
your logs just before this message.

> I suppose I am just wanting confirmation that based on the error message 
> this is likely to be a hardware issure rather than being caused by an 
> as-yet unknown corruption bug in reiserfs (I find this very unlikely based 
> on my past, very stable history with reiserfs).

We cannot tell without those extra messages.
You can execute 'dmesg' and find out what is there in addition to
those vs-13070

Bye,
    Oleg
