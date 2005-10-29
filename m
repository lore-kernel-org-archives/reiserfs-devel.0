From: Lexington Luthor <Lexington.Luthor@gmail.com>
Subject: Re: COW files
Date: Sat, 29 Oct 2005 14:49:55 +0100
Message-ID: <djvum7$6d7$1@sea.gmane.org>
References: <e692861c0510290101u55e5a3a5t898ad72768f8bd1a@mail.gmail.com> <43636C13.5040307@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43636C13.5040307@slaphack.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

David Masover wrote:
> Gregory Maxwell wrote:
> 
>> Files could be COWed by a flag on the cp command (or really, perhaps
>> that should be the default behavior) or with a utility (perhaps run as
>> a periodic script to locate duplicates and COW them. This would
>> greatly speed up the process of copying files.
> 
> Should be on the cp command, but you have to change the cp source for
> that, and everything implementing "copy", including desktop managers.
> There's currently no "copy" system call.  So it's more than just a plugin.
> 

I would love something like this for entire directory trees. Perhaps 
with a reiser4 specific tool that does a COW cp -al.

At the moment, I have to cp -al and use a userspace solution 
(LD_PRELOADed library which traps the open call) to get working COW on 
reiser4.

I am not concerned too much with space usage, but speed is very 
important. This is usually not a problem with reiser4 because it so 
rarely hits the disk with COW trees.

- LL

